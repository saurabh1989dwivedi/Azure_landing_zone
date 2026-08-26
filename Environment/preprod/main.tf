module "resource_group" {
  source = "../../Modules/Resource_ Group"
  rg     = var.rg
}

module "vnet" {
  source     = "../../Modules/VNET"
  vnet       = var.vnet
  depends_on = [module.resource_group]
}
module "subnet" {
  source     = "../../Modules/Subnet"
  subnet     = var.subnet
  depends_on = [var.vnet]
}

module "vm" {
  source     = "../../Modules/VM"
  vm         = var.vm
  depends_on = [module.subnet]

}

module "nsg" {
  source = "../../Modules/NSG"
  nsg = var.nsg
  nsg_rule = var.nsg_rule
  depends_on = [ module.subnet ]
  }
