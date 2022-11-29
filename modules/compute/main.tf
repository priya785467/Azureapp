resource "azurerm_resource_group" "azure-stack-rs" {
  name     = var.name
  location = var.location
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "myappservice-plan"
  location            = var.location
  resource_group_name = azurerm_resource_group.azure-stack-rs.name

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "app_service" {
  name                = "mywebapp-976888 "
  location            = var.location
  resource_group_name = azurerm_resource_group.azure-stack-rs.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  #(Optional)
  site_config {
dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
  
  #(Optional)
  app_settings = {
    "SOME_KEY" = "some-value"
  }

}
