Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
choco install git -y
git clone https://github.com/fireeye/flare-vm.git
git clone https://github.com/fireeye/HXTool.git
git clone https://github.com/gchq/CyberChef.git
.\install.ps1 -password <password>
Enable-RemoteDesktop enable
set-itemproperty -path 'HKLM:\system\currentcontrolset\control\Terminal Server\winstations\rdp-tcp\' -Name 'SecurityLayer' -value 1
set-itemproperty -path 'HKLM:\system\currentcontrolset\control\Terminal Server\winstations\rdp-tcp\' -Name 'UserAuthentication' -value 0
disable-netadapter -name "*" -confirm:$false
enable-netadapter -name "*"
choco install openoffice atom yara adobereader 7zip.install osquery postman -y
python -m pip install --upgrade pip
pip install pandas iptools
invoke-webrequest "http://course-resources.sjc.training.fireeye.com/vm_resources/analysis-tools/Redline-2.0.msi" -usebasicparsing -OutFile "c:\users\public\downloads\Redline-2.0.msi"
invoke-webrequest "http://course-resources.sjc.training.fireeye.com/vm_resources/analysis-tools/IOCe-3.2.0-Signed.msi" -usebasicparsing -OutFile "c:\users\public\downloads\IOCe-3.2.0-Signed.msi"
invoke-webrequest "http://course-resources.sjc.training.fireeye.com/vm_resources/analysis-tools/GoAuditParser_Win.exe" -usebasicparsing -OutFile "c:\users\user1\Downloads\GoAuditParser_Win.exe"
invoke-webrequest "http://course-resources.sjc.training.fireeye.com/vm_resources/analysis-tools/LogParser.msi" -usebasicparsing -OutFile "c:\users\user1\Downloads\LogParser.msi"
invoke-webrequest "http://course-resources.sjc.training.fireeye.com/vm_resources/analysis-tools/LogParserStudio.zip" -usebasicparsing -OutFile "c:\users\user1\Downloads\LogParserStudio.zip"
expand-archive "c:\users\user1\Downloads\LogParserStudio.zip"
msiexec /quiet /qn /i "c:\users\public\downloads\Redline-2.0.msi"
msiexec /quiet /qn /i "c:\users\public\downloads\IOCe-3.2.0-Signed.msi"
msiexec /quiet /qn /i "c:\users\public\downloads\LogParser.msi"
invoke-webrequest "http://course-resources.sjc.training.fireeye.com/vm_resources/scripts/download-analysis-files.ps1" -usebasicparsing -OutFile "c:\users\investigator\Desktop\download-analysis-files.ps1"