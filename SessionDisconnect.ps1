<#
Script by: Scott Forsyth
Contact: scripts@nurvox.com
Last modified: 12-24-2015

.DESCRIPTION
	Connects to server and list open RDP session, and allows you to disconnect them.
.USE
	Prompts you for hostname of server.
	Select either the number of the connection use wish to disconnect from the list, or press "q" to quit.
#>
$server = Read-Host 'Enter Server Name: '

qwinsta /server:$server

echo ""



while ($sessionid -ne 'q' ) {
    $sessionid = Read-host 'Which session would you like to disconnect?  - Type Q to quit: '
    if($sessionid -eq 'q'){exit}
	rwinsta $sessionid /server:$server
}
{exit}