# terraform-azurerm-remote-state

Terraform module to set remote state storage account.

## Usage

```hcl-terraform
module "remote-state"{
  source                = "github.com/helionix/terraform-azurerm-remote-state"
  name                  = "myremotestate"
  location              = "westus"
  enable_delete_lock    = true
}

```

Use provided outputs for provider backend configuration.

```hcl-terraform
terraform{
  backend "azurerm" {
    storage_account_name = "myremotestate-remote-state-sa"
    container_name       = "myremotestate-remote-state-container"
    key                  = "terraform.tfstate"
  }
}
```

Also you would need to supply storage account access key as `access_key` variable for azurerm backend or as `ARM_ACCESS_KEY` environment variable 