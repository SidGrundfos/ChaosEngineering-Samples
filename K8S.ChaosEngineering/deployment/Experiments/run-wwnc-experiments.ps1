function execExperiments(
	[string]$environment,
	[string]$humioToken
){
    Write-Host "Execute basic wwnc chaos experiment on cluster wwnc$($environment)azwe"

	Write-Host "Setting up Environment variables for experiment"
	Set-Item env:APPLICATION_ENTRYPOINT_URL -Value "https://wwnc-api-$($environment)-azwe.grundfos.com/graphql/"
	if($EnvCode -eq "p"){
		Set-Item env:UI_ENTRYPOINT_URL -Value "https://isolutionscloud.grundfos.com/"
	}
	else{
		Set-Item env:UI_ENTRYPOINT_URL -Value "https://gf-web-dynamicscfs-$($environment)-azwe.azurewebsites.net"
	}
	Set-Item env:HUMIO_INGEST_TOKEN -Value $humioToken
	Set-Item env:HUMIO_DATASPACE -Value "gic"
	chaos run "$PSScriptRoot/ex-wwnc-basicchaos.json"
}