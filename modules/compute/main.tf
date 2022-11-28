resource "azurerm_app_service_plan" "dev" {
  name                = "dev"
  resource_group_name = var.resource_group
  location = var.location
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "dev" {
  name                = "test682434"
  resource_group_name = var.resource_group
  location = var.location
  app_service_plan_id = "${azurerm_app_service_plan.dev.id}"

}
