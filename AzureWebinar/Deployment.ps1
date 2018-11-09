New-AzureRmResourceGroupDeployment -Name AVset -ResourceGroupName Test3 `
-Mode Incremental `
-TemplateFile /Users/glen/Desktop/AzureWebinar/LinuxVMcount/template.json `
-TemplateParameterFile /Users/glen/Desktop/AzureWebinar/LinuxVMcount/parameters.json `
-Verbose