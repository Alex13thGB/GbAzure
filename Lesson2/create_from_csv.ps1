
$AdminName = Read-Host "Enter administrator name"
$AdminPassword = Read-Host "Enter a Password" -AsSecureString
$AdminCreds = New-Object System.Management.Automation.PSCredential($AdminName, $AdminPassword)
$vms = Import-Csv ./vms.csv 
ForEach ($vm in $vms) {
    $vm
    $azVm = New-AzVM -ResourceGroupName $vm.ResourceGroupName `
                     -Name $vm.Name `
                     -Image $vm.ImageName `
                     -OpenPorts $vm.OpenPorts.Split(",") `
                     -PublicIpAddressName $vm.PublicIpAddressName `
                     -Location "northeurope" `
                     -Size "Standard_B1ls" `
                     -Credential $AdminCreds
    Set-AzResource -ResourceGroupName $vm.ResourceGroupName `
                   -Name $azVm.Name `
                   -ResourceType "Microsoft.Compute/VirtualMachines" `
                   -Tag @{Environment=$vm.Environment} `
                   -Force
} 
