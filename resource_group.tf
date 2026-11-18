
resource "azurerm_resource_group" "cacthis" {
  name     = "hcp-az-workspace-auth-oidc-cac"
  location = "canadacentral"

  tags = {
    environment = "uat"
    servicetier = "nonprod"
  }
}

resource "azurerm_resource_group" "caethis" {
  name     = "hcp-az-workspace-auth-oidc-cae"
  location = "canadaeast"

  tags = {
    environment = "uat"
    servicetier = "nonprod"
  }
}
