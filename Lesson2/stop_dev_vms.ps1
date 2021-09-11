Get-AzResource -TagName Environment -TagValue "dev" | Get-AzVm | Stop-AzVM -Force
