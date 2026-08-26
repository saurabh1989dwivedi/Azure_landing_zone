rg = {
  rg1 = {
    name     = "global_rg"
    location = "southindia"
  }
}

vnet = {
  vnet1 = {
    name                = "global_vnet"
    resource_group_name = "global_rg"
    location            = "southindia"
    address_space       = ["10.1.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name                 = "frontend_subnet"
    virtual_network_name = "global_vnet"
    resource_group_name  = "global_rg"
    address_prefixes     = ["10.1.1.0/24"]
  }
  subnet2 = {
    name                 = "backend_subnet"
    virtual_network_name = "global_vnet"
    resource_group_name  = "global_rg"
    address_prefixes     = ["10.1.2.0/24"]
  }
}

vm = {
  vm1 = {
    name                = "frontendvm"
    resource_group_name = "global_rg"
    location            = "southindia"
    size                = "Standard_D2s_v3"
    admin_username      = "Paul"
    admin_password      = "Paulheyman@123"
    nic_name            = "frontendvm_nic"
    nic_subnet_name     = "frontend_subnet"
    nic_vnet_name       = "global_vnet"
    nic_pip_name        = "frontend_pip"
  }
  vm2 = {
    name                = "backendvm"
    resource_group_name = "global_rg"
    location            = "southindia"
    size                = "Standard_D2s_v3"
    admin_username      = "Law"
    admin_password      = "Lawheyman@123"
    nic_name            = "backendvm_nic"
    nic_subnet_name     = "backend_subnet"
    nic_vnet_name       = "global_vnet"
    nic_pip_name        = "backend_pip"
  }
}

  nsg = {
    "nsg" = {
  name                = "nsg"
  location            = "southindia"
  resource_group_name = "global_rg"
}
}

nsg_rule = {
  "allow_ssh" = {
    name                   = "Allow-SSH-From-Bastion"
    priority               = 100
    direction              = "Inbound"
    access                 = "Allow"
    protocol               = "Tcp"
    source_port_range      = "*"
    destination_port_range = "22"

    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"

    resource_group_name         = "global_rg"
    network_security_group_name = "nsg"
  }
  "allow_http" = {
    name      = "Allow-HTTP"
    priority  = 110
    direction = "Inbound"
    access    = "Allow"
    protocol  = "Tcp"

    source_port_range      = "*"
    destination_port_range = "80"

    source_address_prefix      = "*"
    destination_address_prefix = "*"

    resource_group_name         = "global_rg"
    network_security_group_name = "nsg"
  }
}