$numbers = 1..5

foreach ($number in $numbers){

$ExtensionName = 'customscript'
$ExtType = 'customscript'
$Publisher = 'Microsoft.Azure.Extensions'

$TheURI = "https://schemascripts.blob.core.windows.net/docker/script.sh"

$ScriptSettings = @{"fileUris" = @($TheURI); "commandToExecute" = "sh .sh";}

Set-AzureRmVMExtension -Publisher "Microsoft.Azure.Extensions" -ExtensionType CustomScript -Settings $ScriptSettings `
-ResourceGroupName Docker -VMName Dockernode$number -Name DockerDeploy -TypeHandlerVersion '2.0' -Location 'eastus' -Verbose `
 -AsJob

}