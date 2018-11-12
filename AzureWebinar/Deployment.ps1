New-AzureRmResourceGroupDeployment -Name AVset -ResourceGroupName devops `
-Mode Complete `
-TemplateUri "https://raw.githubusercontent.com/glendeschema/opnsource/master/AzureWebinar/LinuxVMcount/template.json"`
-TemplateParameterUri "https://raw.githubusercontent.com/glendeschema/opnsource/master/AzureWebinar/LinuxVMcount/parameters.json" `
-Verbose `
-Force

