clear
set-location c:\tools
function remote($arg1) { mstsc -v $arg1}
function lock() { rundll32.exe user32.dll, LockWorkStation }

#Login Summary
$host.ui.RawUI.WindowTitle = “Fear the Power of ROOT!”
Write-Host "PowerShell Version:"$PSVersionTable.PSVersion
set-alias hn hostname
Set-Alias note notepad
Set-Alias grep findstr
Set-Alias putty .\putty.exe
New-Alias -Name npp -Value "C:\Program Files (x86)\Notepad++\notepad++.exe"


Write-Host ""
Write-Host "Custom Commands:"
Write-Host "   | putty | remote | note | npp | grep | hn | Lock |" -ForegroundColor "Red"
#Write-Host "You're $[Environment]::UserName on $[Environment]::MachineName @ $[Environment]::UserDomainName"
Write-Host "---------------------------------------------------------"

#grabs external ip
$extip = Invoke-RestMethod http://ipinfo.io/json | Select -exp ip
$ip=([System.Net.DNS]::GetHostAddresses($hostname)|Where-Object {$_.AddressFamily -eq "InterNetwork"}   |  select-object IPAddressToString)[0].IPAddressToString
Write-Host "External IP:"$extip " | Internal IP:"$ip
Write-Host "---------------------------------------------------------"
Write-Host ""


#turn into showpath script later
#($env:Path).Replace(';',"`n")