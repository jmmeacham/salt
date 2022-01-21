if ( get-itemproperty -path "HKLM:\software\traininglab" -name "HostRenamed" | where-object {$_.HostRenamed -match '0'}) 
    {
        write-output "Rename System"
        $osversion = get-ciminstance win32_operatingsystem | Select-Object version

        switch ($osversion.version.split(".")[0]) {
            "6" {$prefix = "win7"}
            "10" {$prefix = "win10"}
            default {$prefix = "windows"}
        }
        $random = get-random -minimum 1 -maximum 500
        $date = get-date -format "%d%s"
        $name = "$prefix-$date$random"
        write-output $name
        Rename-Computer -NewName $name
        set-itemproperty -path 'HKLM:\software\traininglab' -Name 'HostRenamed' -value 1
        restart-computer -Force
    }
else {
    write-output "System already renamed"
}