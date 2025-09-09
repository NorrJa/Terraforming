resource "azurerm_virtual_machine" "TestVM" {
    name                  = "TestVM"
    location              = azurerm_resource_group.TestRG.location
    resource_group_name   = azurerm_resource_group.TestRG.name
    network_interface_ids = [azurerm_network_interface.TestNIC.id]
    vm_size               = var.vm_size
    delete_os_disk_on_termination = true
    delete_data_disks_on_termination = true

    storage_os_disk {
        name              = "TestOSDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "TestVM"
        admin_username = var.admin_username
        admin_password = var.admin_password
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }
}