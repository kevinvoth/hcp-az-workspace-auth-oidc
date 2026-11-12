
resource "azurerm_resource_group" "cacthis" {
  name     = "hcp-az-cac-workspace-auth-oidc"
  location = "canadacentral"

  tags = {
    environment = "uat"
  }
}

resource "azurerm_resource_group" "caethis" {
  name     = "hcp-az-cae-workspace-auth-oidc"
  location = "canadaeast"

  tags = {
    environment = "uat"
  }
}