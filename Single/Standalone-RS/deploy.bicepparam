using './deploy.bicep'
/*

*/
//The customer name is required and will be appended to the resource name
param customerName = 'swan'
param routeTableName = ''
param vnetNewOrExisting = 'new'
param vnetResourceGroup = ''
param vnetName = ''
param vnetAddressPrefix = '10.0.0.0/16'
param subnet1Name = ''
param subnet1Prefix = '10.0.0.0/24'
param subnet1StartAddress = '10.0.0.4'
param subnet2Name = ''
param subnet2Prefix = '10.0.1.0/24'
param subnet2StartAddress = '10.0.1.4'
param subnet3Name = 'RouteServerSubnet'
param subnet3Prefix = '10.0.2.0/27'
param subnet3StartAddress = '10.0.2.4'
param routeServerName = ''
param routeServerNewOrExisting = 'new'
param publicIP1NewOrExisting = 'new'
param publicIP1Name = ''
param publicIP1ResourceGroup = ''
param publicIP2NewOrExisting = 'new'
param publicIP2Name = ''
param publicIP2ResourceGroup = ''
param fortigateBgpASN = 64520
param NSGName = ''
param fgaNic1Name = ''
param fgaNic2Name = ''
param fgaVmName = ''
param fortiGateImageSKU = 'fortinet_fg-vm_payg_2022'
param customImageReference = ''
param adminUsername = ''
param adminPassword = ''
param fortiGateImageVersion = '7.2.5'
param fortiGateAdditionalCustomData = ''
param instanceType = 'Standard_F4s'
param fortiManagerIP = ''
param fortiManager = 'no'
param fortiGateLicenseFortiFlexA = ''
param fgtLoopbackIP = ''
param fortiManagerSerial = ''
param fortiGateLicenseBYOLA = ''

