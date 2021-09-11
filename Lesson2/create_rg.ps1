$AdminCreds = Get-Credential
$rg = New-AzResourceGroup -Name "RG-PS-01" -Location "northeurope"
New-AzVM -Name "vm-ps-01" -Image UbuntuLTS -ResourceGroupName $rg.ResourceGroupName  -Credential $AdminCreds
