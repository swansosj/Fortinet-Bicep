@description('Location for all resources.')
param location string = resourceGroup().location

@description('Name of the Customer')
param customerName string

@description('Name of Route Table for Public IPs')
param routeTableName string = ''

@description('Identify whether to use a new or existing vnet')
@allowed([
  'new'
  'existing'
])
param vnetNewOrExisting string = 'new'

@description('Resource Group containing the existing virtual network, leave blank if a new VNET is being utilized')
param vnetResourceGroup string = ''

@description('Name of the Azure virtual network, required if utilizing an existing VNET. If no name is provided the default name will be the Resource Group Name as the Prefix and \'-VNET\' as the suffix')
param vnetName string = ''

@description('Virtual Network Address prefix')
param vnetAddressPrefix string = '10.0.0.0/16'

@description('External Subnet Name')
param subnet1Name string = ''

@description('External Subnet Prefix')
param subnet1Prefix string = '10.0.0.0/24'

@description('Subnet 1 start address, 2 consecutive private IPs are required')
param subnet1StartAddress string = '10.0.0.4'

@description('Internal Subnet Name')
param subnet2Name string = ''

@description('Internal Subnet Prefix')
param subnet2Prefix string = '10.0.1.0/24'

@description('Subnet 2 start address, 3 consecutive private IPs are required')
param subnet2StartAddress string = '10.0.1.4'

@description('HA Sync Subnet Name')
param subnet3Name string = ''

@description('HA Sync Subnet Prefix')
param subnet3Prefix string = '10.0.2.0/24'

@description('Subnet 3 start address, 2 consecutive private IPs are required')
param subnet3StartAddress string = '10.0.2.4'

@description('Management Subnet Name')
param subnet4Name string = ''

@description('Management Subnet Prefix')
param subnet4Prefix string = '10.0.3.0/24'

@description('Subnet 4 start address, 2 consecutive private IPs are required')
param subnet4StartAddress string = '10.0.3.4'

@description('Public IP for the Load Balancer for inbound and outbound data of the FortiGate VMs')
@allowed([
  'new'
  'existing'
])
param publicIP1NewOrExisting string = 'new'

@description('Name of External Load Balancer Public IP address, if no name is provided the default name will be provided. Leave blank if IP does not already exist.')
param publicIP1Name string = ''

@description('Public IP Resource Group, this value is required if an existing Public IP is selected')
param publicIP1ResourceGroup string = ''

@description('Public IP for management of the FortiGate A. This deployment uses a Standard SKU Azure Load Balancer and requires a Standard SKU public IP. Microsoft Azure offers a migration path from a basic to standard SKU public IP. The management IP\'s for both FortiGate can be set to none. If no alternative internet access is provided, the SDN Connector functionality for dynamic objects will not work.')
@allowed([
  'new'
  'existing'
  'none'
])
param publicIP2NewOrExisting string = 'new'

@description('Name of FortiaGate A Public IP address, if no name is provided the default name will be provided. Leave blank if IP does not already exist.')
param publicIP2Name string = ''

@description('Public IP for management of the FortiGate B. This deployment uses a Standard SKU Azure Load Balancer and requires a Standard SKU public IP. Microsoft Azure offers a migration path from a basic to standard SKU public IP. The management IP\'s for both FortiGate can be set to none. If no alternative internet access is provided, the SDN Connector functionality for both HA failover and dynamic objects will not work.')
@allowed([
  'new'
  'existing'
  'none'
])
param publicIP3NewOrExisting string = 'new'

@description('Name of FortiaGate B Public IP address, if no name is provided the default name will be provided. Leave blank if IP does not already exist.')
param publicIP3Name string = ''

@description('Public IP Resource Group, this value is required if an existing Public IP is selected')
param publicIP3ResourceGroup string = ''

@description('Public IP Resource Group, this value is required if an existing Public IP is selected')
param publicIP2ResourceGroup string = ''

@description('description')
param NSGName string = ''

@description('Name of External Load Balancer')
param externalLBName string = ''

@description('Name of Internal Load Balancer')
param internalLBName string = ''

@description('FGT A External NIC Name')
param fgaNic1Name string = ''

@description('FGT B External NIC Name')
param fgbNic1Name string = ''

@description('FGT A Internal NIC Name')
param fgaNic2Name string = ''

@description('FGT B Internal NIC Name')
param fgbNic2Name string = ''

@description('FGT A HA NIC Name')
param fgaNic3Name string = ''

@description('FGT B HA NIC Name')
param fgbNic3Name string = ''

@description('FGT B MGMT NIC Name')
param fgbNic4Name string = ''

@description('FGT A MGMT NIC Name')
param fgaNic4Name string = ''

@description('Name of Fortigate A')
param fgaVmName string = ''

@description('Name of Fortigate B')
param fgbVmName string = ''

@description('Identifies whether to to use PAYG (on demand licensing) or BYOL license model (where license is purchased separately)')
@allowed([
  'fortinet_fg-vm'
  'fortinet_fg-vm_payg_2022'
])
param fortiGateImageSKU string = 'fortinet_fg-vm'

@description('By default, the deployment will use Azure Marketplace images. In specific cases, using BYOL custom FortiGate images can be deployed. This requires a reference ')
param customImageReference string = ''

@description('Username for the Virtual Machine')
param adminUsername string

@description('Password for the Virtual Machine')
@secure()
param adminPassword string

@description('Select the FortiGate image version')
@allowed([
  '6.2.0'
  '6.2.2'
  '6.2.4'
  '6.2.5'
  '6.4.0'
  '6.4.10'
  '6.4.11'
  '6.4.12'
  '6.4.2'
  '6.4.3'
  '6.4.5'
  '6.4.6'
  '6.4.7'
  '6.4.8'
  '6.4.9'
  '7.0.0'
  '7.0.1'
  '7.0.10'
  '7.0.11'
  '7.0.12'
  '7.0.2'
  '7.0.3'
  '7.0.4'
  '7.0.5'
  '7.0.6'
  '7.0.8'
  '7.0.9'
  '7.2.0'
  '7.2.1'
  '7.2.2'
  '7.2.3'
  '7.2.4'
  '7.2.5'
  '7.4.0'
  'latest'
])
param fortiGateImageVersion string = '7.2.5'

@description('The ARM template provides a basic configuration. Additional configuration can be added here.')
param fortiGateAdditionalCustomData string = ''

@description('Virtual Machine size selection - must be F4 or other instance that supports 4 NICs. Optimum VM size selected by default')
@allowed([
  'Standard_F4s'
  'Standard_F8s'
  'Standard_F16s'
  'Standard_F4'
  'Standard_F8'
  'Standard_F16'
  'Standard_F8s_v2'
  'Standard_F16s_v2'
  'Standard_F32s_v2'
  'Standard_DS3_v2'
  'Standard_DS4_v2'
  'Standard_DS5_v2'
  'Standard_D8s_v3'
  'Standard_D16s_v3'
  'Standard_D32s_v3'
  'Standard_D8_v4'
  'Standard_D16_v4'
  'Standard_D32_v4'
  'Standard_D8s_v4'
  'Standard_D16s_v4'
  'Standard_D32s_v4'
  'Standard_D8a_v4'
  'Standard_D16a_v4'
  'Standard_D32a_v4'
  'Standard_D8as_v4'
  'Standard_D16as_v4'
  'Standard_D32as_v4'
  'Standard_D8_v5'
  'Standard_D16_v5'
  'Standard_D32_v5'
  'Standard_D8s_v5'
  'Standard_D16s_v5'
  'Standard_D32s_v5'
  'Standard_D8as_v5'
  'Standard_D16as_v5'
  'Standard_D32as_v5'
  'Standard_D8ads_v5'
  'Standard_D16ads_v5'
  'Standard_D32ads_v5'
  'Standard_D8ps_v5'
  'Standard_D16ps_v5'
  'Standard_D32ps_v5'
  'Standard_D8pds_v5'
  'Standard_D16pds_v5'
  'Standard_D32pds_v5'
  'Standard_D8pls_v5'
  'Standard_D16pls_v5'
  'Standard_D32pls_v5'
  'Standard_D8plds_v5'
  'Standard_D16plds_v5'
  'Standard_D32plds_v5'
  'Standard_E8ps_v5'
  'Standard_E16ps_v5'
  'Standard_E32ps_v5'
  'Standard_E8pds_v5'
  'Standard_E16pds_v5'
  'Standard_E32pds_v5'
])
param instanceType string = 'Standard_F4s'

@description('FortiManager IP or DNS name to connect to on port TCP/541')
param fortiManagerIP string = ''

@description('Connect to FortiManager')
@allowed([
  'yes'
  'no'
])
param fortiManager string = 'no'

@description('Primary FortiGate BYOL FortiFlex license token')
param fortiGateLicenseFortiFlexA string = ''

@description('Secondary FortiGate BYOL FortiFlex license token')
param fortiGateLicenseFortiFlexB string = ''

@description('FortiManager serial number to add the deployed FortiGate into the FortiManager')
param fortiManagerSerial string = ''

@description('Primary FortiGate BYOL license content')
param fortiGateLicenseBYOLA string = ''

@description('Secondary FortiGate BYOL license content')
param fortiGateLicenseBYOLB string = ''

var routeTableNameVar = ((routeTableName == '')
  ? '${customerName}-rt-transit-default-prod-${resourceGroup().location}-000'
  : routeTableName)

var vnetNameVar = ((vnetName == '') ? '${customerName}-vnet-transit-prod-${resourceGroup().location}-000' : vnetName)

var subnet1NameVar = ((subnet1Name == '')
  ? '${customerName}-snet-fw-external-prod-${resourceGroup().location}-000'
  : subnet1Name)

var subnet2NameVar = ((subnet2Name == '')
  ? '${customerName}-snet-fw-internal-prod-${resourceGroup().location}-000'
  : subnet2Name)

var subnet3NameVar = ((subnet3Name == '')
  ? '${customerName}-snet-fw-ha-prod-${resourceGroup().location}-000'
  : subnet3Name)

var subnet4NameVar = ((subnet4Name == '')
  ? '${customerName}-snet-fw-mgmt-prod-${resourceGroup().location}-000'
  : subnet4Name)

var publicIP1NameVar = ((publicIP1Name == '')
  ? '${customerName}-pip-fw-elb-prod-${resourceGroup().location}-000'
  : publicIP1Name)

var publicIP1Id = ((publicIP1NewOrExisting == 'new')
  ? publicIP1.id
  : resourceId(publicIP1ResourceGroup, 'Microsoft.Network/publicIPAddresses', publicIP1NameVar))

var publicIP2NameVar = ((publicIP2Name == '')
  ? '${customerName}-pip-fw-mgmt-prod-${resourceGroup().location}000'
  : publicIP2Name)

var publicIP3NameVar = ((publicIP3Name == '')
  ? '${customerName}-fw-mgmt-prod-${resourceGroup().location}-001'
  : publicIP3Name)
var publicIP3Id = ((publicIP3NewOrExisting == 'new')
  ? publicIP3.id
  : resourceId(publicIP3ResourceGroup, 'Microsoft.Network/publicIPAddresses', publicIP3NameVar))
var publicIPAddress3Id = {
    id: publicIP3.id 
  }

var publicIPAddress2Id = {
    id: publicIP2Id
  }

var publicIP2Id = ((publicIP2NewOrExisting == 'new')
  ? publicIP2.id
  : resourceId(publicIP2ResourceGroup, 'Microsoft.Network/publicIPAddresses', publicIP2NameVar))

var NSGNameVar = ((NSGName == '') ? '${customerName}-nsg-fw-default-prod-${resourceGroup().location}-000' : NSGName)
var NSGId = NSG.id

var externalLBNameVar = ((externalLBName == '')
  ? '${customerName}-elb-fw-prod-${resourceGroup().location}-000'
  : externalLBName)
var externalLBBEName = '${customerName}-elb-be-prod-${resourceGroup().location}-000'
var externalLBProbeId = resourceId('Microsoft.Network/loadBalancers/probes/', externalLBNameVar, externalLBProbeName)
var externalLBBEId = resourceId(
  'Microsoft.Network/loadBalancers/backendAddressPools/',
  externalLBNameVar,
  externalLBBEName
)
var externalLBFEId = resourceId(
  'Microsoft.Network/loadBalancers/frontendIPConfigurations/',
  externalLBNameVar,
  externalLBFEName
)
var externalLBProbeName = 'lbprobe'
var externalLBFEName = '${customerName}-elb-fe-prod-${resourceGroup().location}-000'
var internalLBNameVar = ((internalLBName == '')
  ? '${customerName}-ilb-fw-prod-${resourceGroup().location}-000'
  : internalLBName)
var internalLBFEName = '${customerName}-ilb-fe-prod-${resourceGroup().location}-000'
var internalLBBEName = '${customerName}-ilb-be-prod-${resourceGroup().location}-000'
var internalLBFEId = resourceId(
  'Microsoft.Network/loadBalancers/frontendIPConfigurations/',
  internalLBNameVar,
  internalLBFEName
)
var internalLBBEId = resourceId(
  'Microsoft.Network/loadBalancers/backendAddressPools/',
  internalLBNameVar,
  internalLBBEName
)
var internalLBProbeId = resourceId('Microsoft.Network/loadBalancers/probes/', internalLBNameVar, internalLBProbeName)
var internalLBProbeName = 'lbprobe'

var sn1IPArray = split(subnet1Prefix, '.')
var sn1IPArray2ndString = string(sn1IPArray[3])
var sn1IPArray2nd = split(sn1IPArray2ndString, '/')
var sn1CIDRmask = string(int(sn1IPArray2nd[1]))
var sn1IPArray3 = string((int(sn1IPArray2nd[0]) + 1))
var sn1IPArray2 = string(int(sn1IPArray[2]))
var sn1IPArray1 = string(int(sn1IPArray[1]))
var sn1IPArray0 = string(int(sn1IPArray[0]))
var sn1GatewayIP = '${sn1IPArray0}.${sn1IPArray1}.${sn1IPArray2}.${sn1IPArray3}'
var sn1IPStartAddress = split(subnet1StartAddress, '.')
var sn1IPfga = '${sn1IPArray0}.${sn1IPArray1}.${sn1IPArray2}.${int(sn1IPStartAddress[3])}'
var sn1IPfgb = '${sn1IPArray0}.${sn1IPArray1}.${sn1IPArray2}.${(int(sn1IPStartAddress[3])+1)}'
var subnet1Id = ((vnetNewOrExisting == 'new')
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', vnetNameVar, subnet1NameVar)
  : resourceId(vnetResourceGroup, 'Microsoft.Network/virtualNetworks/subnets', vnetNameVar, subnet1Name))

var sn2IPArray = split(subnet2Prefix, '.')
var sn2IPArray2ndString = string(sn2IPArray[3])
var sn2IPArray2nd = split(sn2IPArray2ndString, '/')
var sn2CIDRmask = string(int(sn2IPArray2nd[1]))
var sn2IPArray3 = string((int(sn2IPArray2nd[0]) + 1))
var sn2IPArray2 = string(int(sn2IPArray[2]))
var sn2IPArray1 = string(int(sn2IPArray[1]))
var sn2IPArray0 = string(int(sn2IPArray[0]))
var sn2GatewayIP = '${sn2IPArray0}.${sn2IPArray1}.${sn2IPArray2}.${sn2IPArray3}'
var sn2IPStartAddress = split(subnet2StartAddress, '.')
var sn2IPlb = '${sn2IPArray0}.${sn2IPArray1}.${sn2IPArray2}.${int(sn2IPStartAddress[3])}'
var subnet2Id = ((vnetNewOrExisting == 'new')
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', vnetNameVar, subnet2NameVar)
  : resourceId(vnetResourceGroup, 'Microsoft.Network/virtualNetworks/subnets', vnetNameVar, subnet2Name))

var sn3IPArray = split(subnet3Prefix, '.')
var sn3IPArray2ndString = string(sn3IPArray[3])
var sn3IPArray2nd = split(sn3IPArray2ndString, '/')
var sn3CIDRmask = string(int(sn3IPArray2nd[1]))
var sn3IPArray2 = string(int(sn3IPArray[2]))
var sn3IPArray1 = string(int(sn3IPArray[1]))
var sn3IPArray0 = string(int(sn3IPArray[0]))
var sn3IPStartAddress = split(subnet3StartAddress, '.')
var sn3IPfga = '${sn3IPArray0}.${sn3IPArray1}.${sn3IPArray2}.${int(sn3IPStartAddress[3])}'
var sn3IPfgb = '${sn3IPArray0}.${sn3IPArray1}.${sn3IPArray2}.${(int(sn3IPStartAddress[3])+1)}'
var subnet3Id = ((vnetNewOrExisting == 'new')
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', vnetNameVar, subnet3NameVar)
  : resourceId(vnetResourceGroup, 'Microsoft.Network/virtualNetworks/subnets', vnetNameVar, subnet3Name))

var sn4IPArray = split(subnet4Prefix, '.')
var sn4IPArray2ndString = string(sn4IPArray[3])
var sn4IPArray2nd = split(sn4IPArray2ndString, '/')
var sn4CIDRmask = string(int(sn4IPArray2nd[1]))
var sn4IPArray3 = string((int(sn4IPArray2nd[0]) + 1))
var sn4IPArray2 = string(int(sn4IPArray[2]))
var sn4IPArray1 = string(int(sn4IPArray[1]))
var sn4IPArray0 = string(int(sn4IPArray[0]))
var sn4GatewayIP = '${sn4IPArray0}.${sn4IPArray1}.${sn4IPArray2}.${sn4IPArray3}'
var sn4IPStartAddress = split(subnet4StartAddress, '.')
var sn4IPfga = '${sn4IPArray0}.${sn4IPArray1}.${sn4IPArray2}.${int(sn4IPStartAddress[3])}'
var sn4IPfgb = '${sn4IPArray0}.${sn4IPArray1}.${sn4IPArray2}.${(int(sn4IPStartAddress[3])+1)}'
var subnet4Id = ((vnetNewOrExisting == 'new')
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', vnetNameVar, subnet4NameVar)
  : resourceId(vnetResourceGroup, 'Microsoft.Network/virtualNetworks/subnets', vnetNameVar, subnet4Name))

var sn2IPfga = '${sn2IPArray0}.${sn2IPArray1}.${sn2IPArray2}.${(int(sn2IPStartAddress[3])+1)}'
var sn2IPfgb = '${sn2IPArray0}.${sn2IPArray1}.${sn2IPArray2}.${(int(sn2IPStartAddress[3])+2)}'

var useAZ = true
var pipZones = (useAZ ? pickZones('Microsoft.Network', 'publicIPAddresses', location, 3) : null)
var zone1 = [
  '1'
]
var zone2 = [
  '2'
]
var zones = [
  '1'
  '2'
  '3'
]

var fgaNic1NameVar = ((fgaNic1Name == '')
  ? '${customerName}-nic-fw-external-prod-${resourceGroup().location}-000'
  : fgaNic1Name)
var fgaNic1Id = fgaNic1.id
var fgbNic1NameVar = ((fgbNic1Name == '')
  ? '${customerName}-nic-fw-external-prod-${resourceGroup().location}-001'
  : fgbNic1Name)
var fgbNic1Id = fgbNic1.id
var fgaNic2NameVar = ((fgaNic2Name == '')
  ? '${customerName}-nic-fw-internal-prod-${resourceGroup().location}-000'
  : fgaNic2Name)
var fgaNic2Id = fgaNic2.id
var fgbNic2NameVar = ((fgbNic2Name == '')
  ? '${customerName}-nic-fw-internal-prod-${resourceGroup().location}-001'
  : fgbNic2Name)
var fgbNic2Id = fgbNic2.id
var fgaNic3NameVar = ((fgaNic3Name == '')
  ? '${customerName}-nic-fw-ha-prod-${resourceGroup().location}-000'
  : fgaNic3Name)
var fgaNic3Id = fgaNic3.id
var fgbNic3NameVar = ((fgbNic3Name == '')
  ? '${customerName}-nic-fw-ha-prod-${resourceGroup().location}-001'
  : fgbNic3Name)
var fgbNic3Id = fgbNic3.id
var fgaNic4NameVar = ((fgaNic4Name == '')
  ? '${customerName}-nic-fw-mgmt-prod-${resourceGroup().location}-000'
  : fgaNic4Name)
var fgaNic4Id = fgaNic4.id
var fgbNic4NameVar = ((fgbNic4Name == '')
  ? '${customerName}-nic-fw-mgmt-prod-${resourceGroup().location}-001'
  : fgbNic4Name)
var fgbNic4Id = fgbNic4.id

var fgaVmNameVar = ((fgaVmName == '') ? '${customerName}-fw-prod-${resourceGroup().location}-000' : fgaVmName)
var fgbVmNameVar = ((fgbVmName == '') ? '${customerName}-fw-prod-${resourceGroup().location}-001' : fgbVmName)

var virtualMachinePlan = {
  name: fortiGateImageSKU
  publisher: imagePublisher
  product: imageOffer
}
var imagePublisher = 'fortinet'
var imageOffer = 'fortinet_fortigate-vm_v5'


var availabilitySetName = '${customerName}-avail-fw-${resourceGroup().location}-000'
var availabilitySetId = {
  id: availabilitySet.id
}

var fmgCustomData = ((fortiManager == 'yes')
  ? '\nconfig system central-management\nset type fortimanager\n set fmg ${fortiManagerIP}\nset serial-number ${fortiManagerSerial}\nend\n config system interface\n edit port1\n append allowaccess fgfm\n end\n config system interface\n edit port2\n append allowaccess fgfm\n end\n'
  : '')
var customDataHeader = 'Content-Type: multipart/mixed; boundary="12345"\nMIME-Version: 1.0\n\n--12345\nContent-Type: text/plain; charset="us-ascii"\nMIME-Version: 1.0\nContent-Transfer-Encoding: 7bit\nContent-Disposition: attachment; filename="config"\n\n'
var fgaCustomDataBody = 'config system sdn-connector\n edit AzureSDN\n set type azure\n next\n end\n config router static\n edit 1\n set dst 0.0.0.0 0.0.0.0\n set gateway ${sn1GatewayIP}\n set device port1\n next\n edit 2\n set dst ${vnetAddressPrefix}\n set gateway ${sn2GatewayIP}\n set device port2\n next\n edit 3\n set dst 168.63.129.16 255.255.255.255\n set device port2\n set gateway ${sn2GatewayIP}\n next\n edit 4\n set dst 168.63.129.16 255.255.255.255\n set device port1\n set gateway ${sn1GatewayIP}\n next\n end\n config system probe-response\n set http-probe-value OK\n set mode http-probe\n end\n config system interface\n edit port1\n set mode static\n set ip ${sn1IPfga}/${sn1CIDRmask}\n set description external\n set allowaccess probe-response\n next\n edit port2\n set mode static\n set ip ${sn2IPfga}/${sn2CIDRmask}\n set description internal\n set allowaccess probe-response\n next\n edit port3\n set mode static\n set ip ${sn3IPfga}/${sn3CIDRmask}\n set description hasyncport\n next\n edit port4\n set mode static\n set ip ${sn4IPfga}/${sn4CIDRmask}\n set description hammgmtport\n set allowaccess ping https ssh ftm\n next\n end\n config system ha\n set group-name AzureHA\n set mode a-p\n set hbdev port3 100\n set session-pickup enable\n set session-pickup-connectionless enable\n set ha-mgmt-status enable\n config ha-mgmt-interfaces\n edit 1\n set interface port4\n set gateway ${sn4GatewayIP}\n next\n end\n set override disable\n set priority 255\n set unicast-hb enable\n set unicast-hb-peerip ${sn3IPfgb}\n end\n ${fmgCustomData}${fortiGateAdditionalCustomData}\n'
var fgbCustomDataBody = 'config system sdn-connector\n edit AzureSDN\n set type azure\n next\n end\n  config router static\n  edit 1\n  set dst 0.0.0.0 0.0.0.0\n  set gateway ${sn1GatewayIP}\n  set device port1\n  next\n  edit 2\n  set dst ${vnetAddressPrefix}\n  set gateway ${sn2GatewayIP}\n  set device port2\n  next\n  edit 3\n set dst 168.63.129.16 255.255.255.255\n set device port2\n  set gateway ${sn2GatewayIP}\n  next\n edit 4\n set dst 168.63.129.16 255.255.255.255\n set device port1\n  set gateway ${sn1GatewayIP}\n  next\n  end\n  config system probe-response\n  set http-probe-value OK\n  set mode http-probe\n  end\n  config system interface\n  edit port1\n  set mode static\n  set ip ${sn1IPfgb}/${sn1CIDRmask}\n  set description external\n  set allowaccess probe-response\n  next\n  edit port2\n  set mode static\n  set ip ${sn2IPfgb}/${sn2CIDRmask}\n  set description internal\n  set allowaccess probe-response\n  next\n  edit port3\n  set mode static\n  set ip ${sn3IPfgb}/${sn3CIDRmask}\n  set description hasyncport\n  next\n  edit port4\n  set mode static\n  set ip ${sn4IPfgb}/${sn4CIDRmask}\n  set description hammgmtport\n  set allowaccess ping https ssh ftm\n  next\n  end\n  config system ha\n  set group-name AzureHA\n  set mode a-p\n  set hbdev port3 100\n  set session-pickup enable\n  set session-pickup-connectionless enable\n  set ha-mgmt-status enable\n  config ha-mgmt-interfaces\n  edit 1\n  set interface port4\n  set gateway ${sn4GatewayIP}\n  next\n  end\n  set override disable\n  set priority 255\n  set unicast-hb enable\n  set unicast-hb-peerip ${sn3IPfga}\n  end\n ${fmgCustomData}${fortiGateAdditionalCustomData}\n'
var customDataLicenseHeader = '--12345\nContent-Type: text/plain; charset="us-ascii"\nMIME-Version: 1.0\nContent-Transfer-Encoding: 7bit\nContent-Disposition: attachment; filename="license"\n\n'
var customDataFooter = '\n--12345--\n'
var fgaCustomDataFortiFlex = ((fortiGateLicenseFortiFlexA == '') ? '' : 'LICENSE-TOKEN:${fortiGateLicenseFortiFlexA}\n')
var fgbCustomDataFortiFlex = ((fortiGateLicenseFortiFlexB == '') ? '' : 'LICENSE-TOKEN:${fortiGateLicenseFortiFlexB}\n')
var fgaCustomDataCombined = '${customDataHeader}${fgaCustomDataBody}${customDataLicenseHeader}${fgaCustomDataFortiFlex}${fortiGateLicenseBYOLA}${customDataFooter}'
var fgbCustomDataCombined = '${customDataHeader}${fgbCustomDataBody}${customDataLicenseHeader}${fgbCustomDataFortiFlex}${fortiGateLicenseBYOLB}${customDataFooter}'
var fgaCustomData = base64((((fortiGateLicenseBYOLA == '') && (fortiGateLicenseFortiFlexA == ''))
  ? fgaCustomDataBody
  : fgaCustomDataCombined))
var fgbCustomData = base64((((fortiGateLicenseBYOLB == '') && (fortiGateLicenseFortiFlexB == ''))
  ? fgbCustomDataBody
  : fgbCustomDataCombined))

var imageReferenceCustomImage = {
  id: customImageReference
}

var imageReferenceMarketplace = {
  publisher: imagePublisher
  offer: imageOffer
  sku: fortiGateImageSKU
  version: fortiGateImageVersion
}

module customerName_fortinetdeployment_id './nested_customerName_fortinetdeployment_id.bicep' = {
  name: '${customerName}-fortinetdeployment-${uniqueString(resourceGroup().id)}'
  params: {}
}

resource availabilitySet 'Microsoft.Compute/availabilitySets@2022-08-01' = if (!useAZ) {
  name: availabilitySetName
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  properties: {
    platformFaultDomainCount: 2
    platformUpdateDomainCount: 2
  }
  sku: {
    name: 'Aligned'
  }
}

resource routeTable 'Microsoft.Network/routeTables@2022-05-01' = {
  name: routeTableNameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  properties: {
    routes: [
      {
        name: 'toDefault'
        properties: {
          addressPrefix: '0.0.0.0/0'
          nextHopType: 'Internet'
        }
      }
    ]
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2022-05-01' = if (vnetNewOrExisting == 'new') {
  name: vnetNameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnet1NameVar
        properties: {
          addressPrefix: subnet1Prefix
          routeTable: {
            id: routeTable.id
          }
        }
      }
      {
        name: subnet2NameVar
        properties: {
          addressPrefix: subnet2Prefix
        }
      }
      {
        name: subnet3NameVar
        properties: {
          addressPrefix: subnet3Prefix
        }
      }
      {
        name: subnet4NameVar
        properties: {
          addressPrefix: subnet4Prefix
          routeTable: {
            id: routeTable.id
          }
        }
      }
    ]
  }
}

resource publicIP1 'Microsoft.Network/publicIPAddresses@2022-05-01' = if (publicIP1NewOrExisting == 'new') {
  name: publicIP1NameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  sku: {
    name: 'Standard'
  }
  zones: pipZones
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource publicIP2 'Microsoft.Network/publicIPAddresses@2022-05-01' = if (publicIP2NewOrExisting == 'new') {
  name: publicIP2NameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  sku: {
    name: 'Standard'
  }
  zones: pipZones
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource publicIP3 'Microsoft.Network/publicIPAddresses@2022-05-01' = if (publicIP3NewOrExisting == 'new') {
  name: publicIP3NameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  sku: {
    name: 'Standard'
  }
  zones: pipZones
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource NSG 'Microsoft.Network/networkSecurityGroups@2022-05-01' = {
  name: NSGNameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  properties: {
    securityRules: [
      {
        name: 'AllowAllInbound'
        properties: {
          description: 'Allow all in'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
      {
        name: 'AllowAllOutbound'
        properties: {
          description: 'Allow all out'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 105
          direction: 'Outbound'
        }
      }
    ]
  }
}

resource externalLB 'Microsoft.Network/loadBalancers@2022-05-01' = {
  name: externalLBNameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  sku: {
    name: 'Standard'
  }
  properties: {
    frontendIPConfigurations: [
      {
        name: externalLBFEName
        properties: {
          publicIPAddress: {
            id: publicIP1Id
          }
        }
      }
    ]
    backendAddressPools: [
      {
        name: externalLBBEName
      }
    ]
    loadBalancingRules: [
      {
        properties: {
          frontendIPConfiguration: {
            id: externalLBFEId
          }
          backendAddressPool: {
            id: externalLBBEId
          }
          probe: {
            id: externalLBProbeId
          }
          protocol: 'Tcp'
          frontendPort: 80
          backendPort: 80
          enableFloatingIP: true
          idleTimeoutInMinutes: 5
        }
        name: 'PublicLBRule-FE1-http'
      }
      {
        properties: {
          frontendIPConfiguration: {
            id: externalLBFEId
          }
          backendAddressPool: {
            id: externalLBBEId
          }
          probe: {
            id: externalLBProbeId
          }
          protocol: 'Udp'
          frontendPort: 10551
          backendPort: 10551
          enableFloatingIP: true
          idleTimeoutInMinutes: 5
        }
        name: 'PublicLBRule-FE1-udp10551'
      }
    ]
    probes: [
      {
        properties: {
          protocol: 'Tcp'
          port: 8008
          intervalInSeconds: 5
          numberOfProbes: 2
        }
        name: externalLBProbeName
      }
    ]
  }
}

resource internalLB 'Microsoft.Network/loadBalancers@2022-05-01' = {
  name: internalLBNameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  sku: {
    name: 'Standard'
  }
  properties: {
    frontendIPConfigurations: [
      {
        name: internalLBFEName
        properties: {
          privateIPAddress: sn2IPlb
          privateIPAllocationMethod: 'Static'
          subnet: {
            id: subnet2Id
          }
        }
        zones: (useAZ ? zones : null)
      }
    ]
    backendAddressPools: [
      {
        name: internalLBBEName
      }
    ]
    loadBalancingRules: [
      {
        properties: {
          frontendIPConfiguration: {
            id: internalLBFEId
          }
          backendAddressPool: {
            id: internalLBBEId
          }
          probe: {
            id: internalLBProbeId
          }
          protocol: 'all'
          frontendPort: 0
          backendPort: 0
          enableFloatingIP: true
          idleTimeoutInMinutes: 5
        }
        name: 'lbruleFE2all'
      }
    ]
    probes: [
      {
        properties: {
          protocol: 'Tcp'
          port: 8008
          intervalInSeconds: 5
          numberOfProbes: 2
        }
        name: internalLBProbeName
      }
    ]
  }
  dependsOn: [
    vnet
  ]
}

resource fgaNic1 'Microsoft.Network/networkInterfaces@2022-05-01' = {
  name: fgaNic1NameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAddress: sn1IPfga
          privateIPAllocationMethod: 'Static'
          subnet: {
            id: subnet1Id
          }
          loadBalancerBackendAddressPools: [
            {
              id: externalLBBEId
            }
          ]
        }
      }
    ]
    enableIPForwarding: true
    enableAcceleratedNetworking: true
    networkSecurityGroup: {
      id: NSGId
    }
  }
  dependsOn: [
    vnet
    externalLB
  ]
}

resource fgbNic1 'Microsoft.Network/networkInterfaces@2022-05-01' = {
  name: fgbNic1NameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAddress: sn1IPfgb
          privateIPAllocationMethod: 'Static'
          subnet: {
            id: subnet1Id
          }
          loadBalancerBackendAddressPools: [
            {
              id: externalLBBEId
            }
          ]
        }
      }
    ]
    enableIPForwarding: true
    enableAcceleratedNetworking: true
    networkSecurityGroup: {
      id: NSGId
    }
  }
  dependsOn: [
    vnet
    externalLB
  ]
}

resource fgaNic2 'Microsoft.Network/networkInterfaces@2022-05-01' = {
  name: fgaNic2NameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Static'
          privateIPAddress: sn2IPfga
          subnet: {
            id: subnet2Id
          }
          loadBalancerBackendAddressPools: [
            {
              id: internalLBBEId
            }
          ]
        }
      }
    ]
    enableIPForwarding: true
    enableAcceleratedNetworking: true
    networkSecurityGroup: {
      id: NSGId
    }
  }
  dependsOn: [
    vnet
    internalLB
  ]
}

resource fgbNic2 'Microsoft.Network/networkInterfaces@2022-05-01' = {
  name: fgbNic2NameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Static'
          privateIPAddress: sn2IPfgb
          subnet: {
            id: subnet2Id
          }
          loadBalancerBackendAddressPools: [
            {
              id: internalLBBEId
            }
          ]
        }
      }
    ]
    enableIPForwarding: true
    enableAcceleratedNetworking: true
    networkSecurityGroup: {
      id: NSGId
    }
  }
  dependsOn: [
    vnet
    internalLB
  ]
}

resource fgaNic3 'Microsoft.Network/networkInterfaces@2022-05-01' = {
  name: fgaNic3NameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Static'
          privateIPAddress: sn3IPfga
          subnet: {
            id: subnet3Id
          }
        }
      }
    ]
    enableIPForwarding: true
    enableAcceleratedNetworking: true
    networkSecurityGroup: {
      id: NSGId
    }
  }
  dependsOn: [
    vnet
  ]
}

resource fgbNic3 'Microsoft.Network/networkInterfaces@2022-05-01' = {
  name: fgbNic3NameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Static'
          privateIPAddress: sn3IPfgb
          subnet: {
            id: subnet3Id
          }
        }
      }
    ]
    enableIPForwarding: true
    enableAcceleratedNetworking: true
    networkSecurityGroup: {
      id: NSGId
    }
  }
  dependsOn: [
    vnet
  ]
}


resource fgaNic4 'Microsoft.Network/networkInterfaces@2022-05-01' = {
  name: fgaNic4NameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Static'
          privateIPAddress: sn4IPfga
          publicIPAddress: ((publicIP2NewOrExisting != 'none') ? publicIPAddress2Id : null)
          subnet: {
            id: subnet4Id
          }
        }
      }
    ]
    enableIPForwarding: true
    enableAcceleratedNetworking: true
    networkSecurityGroup: {
      id: NSGId
    }
  }
  dependsOn: [
    vnet
  ]
}

resource fgbNic4 'Microsoft.Network/networkInterfaces@2022-05-01' = {
  name: fgbNic4NameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Static'
          privateIPAddress: sn4IPfgb
          publicIPAddress: ((publicIP3NewOrExisting != 'none') ? publicIPAddress3Id : null)
          subnet: {
            id: subnet4Id
          }
        }
      }
    ]
    enableIPForwarding: true
    enableAcceleratedNetworking: true
    networkSecurityGroup: {
      id: NSGId
    }
  }
  dependsOn: [
    vnet
  ]
}

resource fgaVm 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: fgaVmNameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  identity: {
    type: 'SystemAssigned'
  }
  zones: (useAZ ? zone1 : null)
  plan: (((fortiGateImageSKU == 'fortinet_fg-vm') && (customImageReference != '')) ? null : virtualMachinePlan)
  properties: {
    hardwareProfile: {
      vmSize: instanceType
    }
    availabilitySet: ((!useAZ) ? availabilitySetId : null)
    osProfile: {
      computerName: fgaVmNameVar
      adminUsername: adminUsername
      adminPassword: adminPassword
      customData: fgaCustomData
    }
    storageProfile: {
      imageReference: (((fortiGateImageSKU == 'fortinet_fg-vm') && (customImageReference != ''))
        ? imageReferenceCustomImage
        : imageReferenceMarketplace)
      osDisk: {
        createOption: 'FromImage'
      }
      dataDisks: [
        {
          diskSizeGB: 30
          lun: 0
          createOption: 'Empty'
        }
      ]
    }
    networkProfile: {
      networkInterfaces: [
        {
          properties: {
            primary: true
          }
          id: fgaNic1Id
        }
        {
          properties: {
            primary: false
          }
          id: fgaNic2Id
        }
        {
          properties: {
            primary: false
          }
          id: fgaNic3Id
        }
        {
          properties: {
            primary: false
          }
          id: fgaNic4Id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
  dependsOn: []
}

resource fgbVm 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: fgbVmNameVar
  location: location
  tags: {
    'iv-monitoringEnabled': 'false'
  }
  identity: {
    type: 'SystemAssigned'
  }
  zones: (useAZ ? zone2 : null)
  plan: (((fortiGateImageSKU == 'fortinet_fg-vm') && (customImageReference != '')) ? null : virtualMachinePlan)
  properties: {
    hardwareProfile: {
      vmSize: instanceType
    }
    availabilitySet: ((!useAZ) ? availabilitySetId : null)
    osProfile: {
      computerName: fgbVmNameVar
      adminUsername: adminUsername
      adminPassword: adminPassword
      customData: fgbCustomData
    }
    storageProfile: {
      imageReference: (((fortiGateImageSKU == 'fortinet_fg-vm') && (customImageReference != ''))
        ? imageReferenceCustomImage
        : imageReferenceMarketplace)
      osDisk: {
        createOption: 'FromImage'
      }
      dataDisks: [
        {
          diskSizeGB: 30
          lun: 0
          createOption: 'Empty'
        }
      ]
    }
    networkProfile: {
      networkInterfaces: [
        {
          properties: {
            primary: true
          }
          id: fgbNic1Id
        }
        {
          properties: {
            primary: false
          }
          id: fgbNic2Id
        }
        {
          properties: {
            primary: false
          }
          id: fgbNic3Id
        }
        {
          properties: {
            primary: false
          }
          id: fgbNic4Id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

output fortiGateAManagementPublicIP string = ((publicIP2NewOrExisting == 'new') ? reference(publicIP2Id).ipAddress : '')
output fortiGateBManagementPublicIP string = ((publicIP3NewOrExisting == 'new') ? reference(publicIP3Id).ipAddress : '')
