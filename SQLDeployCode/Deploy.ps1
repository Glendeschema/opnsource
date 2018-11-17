


#region...Login & Set Variables for the entire Server

Write-Host "Hello & Welcome, insert your Credentials to login to your Azure Subscription" -ForegroundColor Blue

#Login-AzureRmAccount

#These are your variables for provisioning the Database:

$Resgroupname = "SqlResourcegroup-$(Get-Random -Maximum 10)"
$location = "eastus"



#You will be inserting the admin login and password for your server:
$adminlogin = "SqlAdmin"
$password = "ChangeYourSql@AdminPass1"

#Set server name:
$servername = "sqlserver-$(Get-Random -Minimum 0 -Maximum 10)"

#Your database name:
$databasename = "SQLDatabase"

#The ip address range for the your server:
$startip = "0.0.0.0"
$endip = "0.0.0.0"

#endregion

#region...

Write-host "You now creating a new Resourcegroup" -ForegroundColor Yellow

#create the resourcegroup

$rg = Get-AzureRmResourceGroup

if ($rg.ResourceGroupName -ne $resourcegroup) {

$resourcegroup = New-AzureRmResourceGroup `
    -Name $Resgroupname `
    -Location $location -Verbose
}
Write-Host "This is were you will create the SQL Server" -ForegroundColor Yellow

#Create the SQL Server
$server = New-AzureRmSqlServer `
    -ResourceGroupName $Resgroupname `
    -ServerName $servername `
    -Location $location `
    -SqlAdministratorCredentials $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $adminlogin, $(ConvertTo-SecureString -String $password -AsPlainText -Force)) `
    -ErrorAction SilentlyContinue -Verbose

# Create a server firewall rule that allows access from the specified IP range

#Getting Public Address 
$publicIp =  Invoke-WebRequest http://myexternalip.com/raw -UseBasicParsing

$publicIp = $publicIp.Content

New-AzureRmSqlServerFirewallRule -FirewallRuleName "Allow IP1" `
-StartIpAddress $publicIp -EndIpAddress $publicIp `
-ServerName $servername `
-ResourceGroupName $Resgroupname `
-Verbose

Write-Host "Lastly you are creating a blank Database" -ForegroundColor Yellow

# Create a blank database with an S0 performance level
$database = New-AzureRmSqlDatabase  -ResourceGroupName $Resgroupname `
    -ServerName $servername `
    -DatabaseName $databasename `
    -RequestedServiceObjectiveName "S0" `
    -SampleName "AdventureWorksLT" `
    -ErrorAction SilentlyContinue 

#endregion

Write-Host "Gweng Blood, Kidding your SQL Database Server deployment is complete, Go check in the Portal" -ForegroundColor Red



<#

$Resgroupname = "SqlResourcegroup-$(Get-Random -Maximum 10)"
$location = "eastus"

#get existing resource Groups

$rg = Get-AzureRmResourceGroup

if ($rg.ResourceGroupName -ne $resourcegroup) {

Write-Output "Creating Resource group"
$resourcegroup = New-AzureRmResourceGroup `
    -Name $Resgroupname `
    -Location $location -Verbose
}

#>