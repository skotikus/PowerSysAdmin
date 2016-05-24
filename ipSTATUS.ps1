<#
ipStatus.PS1
IP Range availability checker v1
Script by: Scott Forsyth
Contact: scripts@nurvox.com
Last modified: 3/8/2013

.DESCRIPTION
	Runs ping on all ip addresses in block and lets you know what is free 
.USE
	Just run with no args
.NOTES
	- have it auto fill ip scheme for the subnet its run on
	- one version of this I had it have all the ips listed and where green / red based on availablility.
#>

CLS
$base = Read-Host "What is your base ip scheme, ie 192.168.0"
$addresses = @()
$hash = @{}
$results = @()
#Set the ips to be checked
$range = (1..255)
foreach ($ip in $range) {
	$addresses += "$base.$ip"
	}
#$range = @(1..255)
#foreach ($ip in $range) {
#	$addresses += "$base2.$ip"
#	}
	
# Starts Bckground processes for testing connections
$job = start-job -scriptblock {test-connection @args -count 1 -Quiet} -ArgumentList (,$addresses)

Wait-Job -Job $job | Out-Null
$list = (Receive-Job $job)

# stop and remove all jobs  
get-job | stop-job
get-job | remove-job

for ($i=0; $i -le $addresses.Count-1; $i++) {
	$hash.set_Item($addresses[$i],$list[$i])
	}
$hash.GetEnumerator() | ? {$_.Value -eq 'False'} | Select Name -expand Name | sort