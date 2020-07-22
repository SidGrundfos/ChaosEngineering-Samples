[CmdletBinding()]
param (
    [switch]$IsTest,
	[string]$HumioToken,
	[string]$EnvCode,
	[boolean]$Force = $false
)
process {
	$ErrorActionPreference = "Stop";
	Import-Module "$PSScriptRoot/Experiments/run-wwnc-experiments.ps1"

	# CALL THE ACTUAL EXPERIMENT HERE
	Write-Host "Starting deployment at $((Get-Date).ToString("yyyyMMdd:hhmmss"))"
	if($EnvCode -eq "x1"){
		execExperiments -environment "d" -humioToken $HumioToken 
	} 
	else {
		execExperiments -environment $EnvCode -humioToken $HumioToken 
	}
}