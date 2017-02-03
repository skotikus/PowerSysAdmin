#HTML STYLING
$a = "<style>"
$a = $a + "BODY{background-color:white;}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:thistle}"
$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:palegoldenrod}"
$a = $a + "</style>"

#More promising script
Get-WinEvent -LogName security -MaxEvents 150 | select Id, Task, RecordId, MachineName, UserId, TimeCreated | where { $_.Id -eq "4624" } | ConvertTo-Html -head $a -body "<H2>DAC Client Changes</H2>"| out-file C:\Test.htm
Invoke-Expression C:\Test.htm

#out-gridview


#Translate SID
#(New-Object System.Security.Principal.SecurityIdentifier($SIDTOCHECK)).Translate([System.Security.Principal.NTAccount]).value


<#
- <EventData>
 <Data Name="SubjectUserSid">S-1-5-21-3457937927-2839227994-823803824-1104</Data>
 <Data Name="SubjectUserName">dadmin</Data>
 <Data Name="SubjectDomainName">CONTOSO</Data> 
 <Data Name="SubjectLogonId">0x43659</Data> 
 
 <Data Name="ObjectType">File</Data> 
 <Data Name="ObjectName">C:\\Documents\\netcat-1.11</Data> 

 <Data Name="OldSd">D:AI(A;OICIID;FA;;;S-1-5-21-3457937927-2839227994-823803824-2104)(A;OICIID;FA;;;S-1-5-21-3457937927-2839227994-823803824-1104)(A;OICIID;FA;;;SY)(A;OICIID;FA;;;BA)</Data> 
 <Data Name="NewSd">D:ARAI(A;OICI;FA;;;WD)(A;OICIID;FA;;;S-1-5-21-3457937927-2839227994-823803824-2104)(A;OICIID;FA;;;S-1-5-21-3457937927-2839227994-823803824-1104)(A;OICIID;FA;;;SY)(A;OICIID;FA;;;BA)</Data> 
#>