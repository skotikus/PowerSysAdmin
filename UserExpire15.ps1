<#
Script by: Scott Forsyth
Contact: scripts@nurvox.com
Last modified: 12-22-2015

.DESCRIPTION
	List all users in domain whos' accounts will be expiring in the next 15 days. 
.USE
	Just run with no args
#>


Import-Module activedirectory

#Untested Expired now section
#Echo "Expried NOW"
#echo ""
#Get-ADUser -filter {Enabled -eq $True -and PasswordExpired -eq $True} –Properties "Displayname" | Select-Object -Property "Displayname"

#Shows users whos' accounts will be expiring in the next 15 days.
Echo "Expiring in the next 15 days"
Get-ADUser -filter {Enabled -eq $True -and PasswordNeverExpires -eq $False} –Properties "DisplayName", "msDS-UserPasswordExpiryTimeComputed" | Select-Object -Property "Displayname",@{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}} | where {($_.ExpiryDate | get-date)  -gt (get-date) -and ($_.ExpiryDate | get-date) -lt (get-date).adddays(15) }
