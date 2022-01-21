Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
choco install Boxstarter -y
$networkname = get-netconnectionprofile | Select-Object -property "name"
set-netconnectionprofile -name $networkname.name -networkcategory Private 
new-item -path "HKLM:\Software\" -name "TrainingLab"
set-itemproperty -path 'HKLM:\software\traininglab' -Name 'HostRenamed' -value 0