#install and configure nxlog
if (get-service nxlog -ErrorAction SilentlyContinue) {
    echo "already installed"
} else {
    choco install nxlog -y
    stop-service -name "nxlog"
    invoke-webrequest http://course-resources.sjc.training.fireeye.com/agents/nxlog/nxlog.conf -usebasicparsing -OutFile "C:\Program Files (x86)\nxlog\conf\nxlog.conf"
    invoke-webrequest http://course-resources.sjc.training.fireeye.com/agents/nxlog/ms_vistalog.conf -usebasicparsing -OutFile "C:\Program Files (x86)\nxlog\conf\ms_vistalog.conf"
    invoke-webrequest http://course-resources.sjc.training.fireeye.com/agents/nxlog/output_udp.conf -usebasicparsing -OutFile "C:\Program Files (x86)\nxlog\conf\output_udp.conf"
    start-service -name "nxlog"
}