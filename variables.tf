# File for variable definition

variable "prefix" {
  description = "(Required) Prefix for resources"
}

variable "location" {
  description = " (Required) Azure location for resources"
}

variable "tags" {
  description = "Map of tags to apply to taggable resources in this module.  By default the taggable resources are tagged with the name defined above and this map is merged in"
  type        = "map"
  default     = {}
}

variable "storage_account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard* and Premium. Changing this forces a new resource to be created"
  default     = "Standard"
}

variable "storage_account_kind" {
  description = "Define the Kind of account. Valid options are Storage, StorageV2* and BlobStorage.  Changing this forces a new resource to be created"
  default     = "StorageV2"
}

variable "storage_account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS*, GRS, RAGRS and ZRS."
  default     = "LRS"
}

variable "enable_delete_lock" {
  default = false
}