Enable-RemoteDesktop enable
set-itemproperty -path 'HKLM:\system\currentcontrolset\control\Terminal Server\winstations\rdp-tcp\' -Name 'SecurityLayer' -value 1
set-itemproperty -path 'HKLM:\system\currentcontrolset\control\Terminal Server\winstations\rdp-tcp\' -Name 'UserAuthentication' -value 0
disable-netadapter -name "*"
enable-netadapter -name "*"