resource "azurerm_resource_group" "remote_state_rg" {
  name = "${var.prefix}-remote-state-rg"
  location = "${var.location}"
  tags = "${var.tags}"
}

resource "azurerm_storage_account" "remote_state_sa" {
  name = "${var.prefix}remotestatesa"
  location = "${azurerm_resource_group.remote_state_rg.location}"
  account_tier = "${var.storage_account_tier}"
  resource_group_name = "${azurerm_resource_group.remote_state_rg.name}"
  account_replication_type = "${var.storage_account_replication_type}"

  lifecycle {
    prevent_destroy = true
  }

}

resource "azurerm_storage_container" "terraform_remote_state_container" {
  name = "${var.prefix}-remote-state-container"
  resource_group_name = "${azurerm_resource_group.remote_state_rg.name}"
  storage_account_name = "${azurerm_storage_account.remote_state_sa.name}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_management_lock" "state_storage_delete_lock" {
  count = "${var.enable_delete_lock ? 0 : 1}"
  name = "${var.prefix}-remote-state-delete-lock"
  scope = "${azurerm_storage_account.remote_state_sa.id}"
  lock_level = "CanNotDelete"
  notes = "Lock remote state storage account from deletion"
}