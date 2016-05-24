#remote MSI installer Script
#Scott Forsyth


#Variables

$computername = Read-Host 'Enter Target Computer Hostname'

$sourcefile = Read-Host 'Enter path to file to install'

#This section will install the software 

#foreach ($computer in $computername) 

#{

$destinationFolder = "\\$computername\C$\itfolder\"

#This section will copy the $sourcefile to the $destinationfolder. If the Folder does not exist it will create it.

if (!(Test-Path -path $destinationFolder))

{

New-Item $destinationFolder -Type Directory

}

Copy-Item -Path $sourcefile -Destination $destinationFolder

Invoke-Command -ComputerName $computername -ScriptBlock { & cmd /c "msiexec.exe /i c:\itfolder\vipre-agent.msi" /qn ADVANCED_OPTIONS=1 CHANNEL=100}

#}