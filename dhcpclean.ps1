#Script by: Scott Forsyth
#Last modified: 11/12/2016
#Goes through and cleans the DHCP for items that our over their lease time.

$computername = read-host "DHCP Server hostname"

$scopeid = read-host "IP Address of Scope (ie-192.168.0.0)"

foreach ($object in Get-DhcpServerv4Lease -ComputerName $computername -ScopeId $scopeid)

{

      if ($object.leaseExpiryTime -le (Get-Date))

      {

            $object.hostname

            Remove-DhcpServerv4Lease -ComputerName $computername -IPAddress ($object.IPAddress).IPAddressToString

      }

}