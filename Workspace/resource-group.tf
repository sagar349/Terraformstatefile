resource "azurerm_resource_group" "main" {
  name     = "${var.project_name}-rg${local.workspace_suffix}"
  location = local.current_config.location

  tags = {
    Environment = terraform.workspace
    Project     = var.project_name
  }
}
