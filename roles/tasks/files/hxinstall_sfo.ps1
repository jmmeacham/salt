#hx install
$hx_type = "sfo"
$hx_version = "32.30.13"
if (get-service xagt -ErrorAction SilentlyContinue) {
    echo "already installed"
} else {
    switch ($hx_type) {
        "sfo" {
            invoke-webrequest "http://course-resources.sjc.training.fireeye.com/agents/hx/sfo/IMAGE_HX_AGENT_WIN_$hx_version.zip" -usebasicparsing -OutFile "$hx_version.zip"
        }
        "ork" {
            invoke-webrequest "http://course-resources.sjc.training.fireeye.com/agents/hx/ork/IMAGE_HX_AGENT_WIN_$hx_version.zip" -usebasicparsing -OutFile "$hx_version.zip"
        }
        "helix" {
            invoke-webrequest "http://course-resources.sjc.training.fireeye.com/agents/hx/helix/IMAGE_HX_AGENT_WIN_$hx_version.zip" -usebasicparsing -OutFile "$hx_version.zip"
        }
        "none" {
            write-output "do nothing"
        }
        default { 
            write-output "do nothing"
        }
    }
    expand-archive "$hx_version.zip"
    invoke-expression "msiexec /quiet /qn /i $hx_version\xagtSetup_$hx_version'_universal.msi'"
}