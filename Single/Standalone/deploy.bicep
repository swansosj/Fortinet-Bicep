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

@description('Public IP for the Load Balancer for inbound and outbound data of the FortiGate VMs')
@allowed([
  'new'
  'existing'
  'none'
])
param publicIP1NewOrExisting string = 'new'

@description('Name of External Load Balancer Public IP address, if no name is provided the default name will be provided. Leave blank if IP does not already exist.')
param publicIP1Name string = ''

@description('Public IP Resource Group, this value is required if an existing Public IP is selected')
param publicIP1ResourceGroup string = ''

@description('description')
param NSGName string = ''

@description('FGT A External NIC Name')
param fgaNic1Name string = ''

@description('FGT A Internal NIC Name')
param fgaNic2Name string = ''

@description('Name of Fortigate A')
param fgaVmName string = ''


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

@description('FortiManager serial number to add the deployed FortiGate into the FortiManager')
param fortiManagerSerial string = ''

@description('Primary FortiGate BYOL license content')
param fortiGateLicenseBYOLA string = ''


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

var publicIP1NameVar = ((publicIP1Name == '')
  ? '${customerName}-pip-fw-external-prod-${resourceGroup().location}-000'
  : publicIP1Name)

var publicIP1Id = ((publicIP1NewOrExisting == 'new')
  ? {
      id: publicIP1.id
    }
  : {
      id: resourceId(publicIP1ResourceGroup, 'Microsoft.Network/publicIPAddresses', publicIP1NameVar)
    })


var NSGNameVar = ((NSGName == '') ? '${customerName}-nsg-fw-default-prod-${resourceGroup().location}-000' : NSGName)
var NSGId = NSG.id


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
var subnet2Id = ((vnetNewOrExisting == 'new')
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', vnetNameVar, subnet2NameVar)
  : resourceId(vnetResourceGroup, 'Microsoft.Network/virtualNetworks/subnets', vnetNameVar, subnet2Name))
var sn2IPfga = '${sn2IPArray0}.${sn2IPArray1}.${sn2IPArray2}.${(int(sn2IPStartAddress[3])+1)}'

var useAZ = true
var pipZones = (useAZ ? pickZones('Microsoft.Network', 'publicIPAddresses', location, 3) : null)
var zone1 = [
  '1'
]


var fgaNic1NameVar = ((fgaNic1Name == '')
  ? '${customerName}-nic-fw-external-prod-${resourceGroup().location}-000'
  : fgaNic1Name)
var fgaNic1Id = fgaNic1.id
var fgaNic2NameVar = ((fgaNic2Name == '')
  ? '${customerName}-nic-fw-internal-prod-${resourceGroup().location}-000'
  : fgaNic2Name)
var fgaNic2Id = fgaNic2.id


var fgaVmNameVar = ((fgaVmName == '') ? '${customerName}-fw-prod-${resourceGroup().location}-000' : fgaVmName)

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
var fgaCustomDataBody = 'config system sdn-connector\n edit AzureSDN\n set type azure\n next\n end\n config router static\n edit 1\n set dst 0.0.0.0 0.0.0.0\n set gateway ${sn1GatewayIP}\n set device port1\n next\n edit 2\n set dst ${vnetAddressPrefix}\n set gateway ${sn2GatewayIP}\n set device port2\n next\n edit 3\n set dst 168.63.129.16 255.255.255.255\n set device port2\n set gateway ${sn2GatewayIP}\n next\n edit 4\n set dst 168.63.129.16 255.255.255.255\n set device port1\n set gateway ${sn1GatewayIP}\n next\n end\n config system probe-response\n set http-probe-value OK\n set mode http-probe\n end\n config system interface\n edit port1\n set mode static\n set ip ${sn1IPfga}/${sn1CIDRmask}\n set description external\n set allowaccess ping https ssh ftm\n next\n edit port2\n set mode static\n set ip ${sn2IPfga}/${sn2CIDRmask}\n set description internal\n next\n end\n ${fmgCustomData}${fortiGateAdditionalCustomData}\n'
var customDataLicenseHeader = '--12345\nContent-Type: text/plain; charset="us-ascii"\nMIME-Version: 1.0\nContent-Transfer-Encoding: 7bit\nContent-Disposition: attachment; filename="license"\n\n'
var customDataFooter = '\n--12345--\n'
var fgaCustomDataFortiFlex = ((fortiGateLicenseFortiFlexA == '') ? '' : 'LICENSE-TOKEN:${fortiGateLicenseFortiFlexA}\n')
var fgaCustomDataCombined = '${customDataHeader}${fgaCustomDataBody}${customDataLicenseHeader}${fgaCustomDataFortiFlex}${fortiGateLicenseBYOLA}${customDataFooter}'
var fgaCustomData = base64((((fortiGateLicenseBYOLA == '') && (fortiGateLicenseFortiFlexA == ''))
  ? fgaCustomDataBody
  : fgaCustomDataCombined))

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
          publicIPAddress: ((publicIP1NewOrExisting != 'none') ? publicIP1Id : null)
          subnet: {
            id: subnet1Id
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


