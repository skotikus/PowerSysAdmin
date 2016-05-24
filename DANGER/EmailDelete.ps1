<#
Script by: Scott Forsyth
Contact: scripts@nurvox.com
Last modified: 2-22-2016

.DESCRIPTION
	Will recursively go through all o365 or exchange and remove a email address based on subject and sender 
.USE
	To use on o365, use o365connect.ps1 first
	
	Fill in the subject and the sender's email address, cross your fingers, hold on to your butt, and run it.
	
.WARNING
	DOUBLE CHECK YOUR WORK BEFORE RUNNING, YOU COULD DELETE ALL MAIL ON THERE SERVER POTENTIALLY.
	*Don't ask how I know :-(
#>

Get-Mailbox -ResultSize unlimited | Search-Mailbox -SearchQuery 'subject:"email subject line" from:"user@emailaddress.com"' -deletecontent