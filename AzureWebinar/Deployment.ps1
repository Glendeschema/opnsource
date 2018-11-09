New-AzureRmResourceGroupDeployment -Name AVset -ResourceGroupName Test3 `
-Mode Complete `
-TemplateUri "https://raw.githubusercontent.com/glendeschema/opnsource/master/AzureWebinar/LinuxVMcount/template.json"`
-TemplateParameterUri "https://raw.githubusercontent.com/glendeschema/opnsource/master/AzureWebinar/LinuxVMcount/parameters.json" `
-Verbose `
-Force

