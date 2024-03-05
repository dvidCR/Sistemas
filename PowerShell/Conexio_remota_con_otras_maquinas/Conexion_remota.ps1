Test-WsMan 192.168.10.20

#Get-NetConnectionProfile

#Set-NetConnectionProfile -InterfaceIndex 4 -NetworkCategory Private

Enable-PSRemoting -Force

Set-Item wsman:\localhost\client\trustedhosts *

Restart-Service WinRM

#winrm enumerate winrm/config/listener

#winrm get winrm/config

#winrm quickconfig

Invoke-Command -ComputerName 192.168.10.20 -ScriptBlock { Get-ChildItem C:\ } -credential Powershell

Enter-PSSession -ComputerName 192.168.10.20 -Credential Powershell