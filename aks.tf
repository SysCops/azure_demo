resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  key_vault_secrets_provider {
          secret_rotation_enabled = true
        }

        web_app_routing {
          dns_zone_id = ""
    } 
}

# resource "helm_release" "nginx_ingress" {
#   name       = "ingress-nginx"
#   repository = "https://kubernetes.github.io/ingress-nginx"
#   chart      = "ingress-nginx"
#   version    = "4.10.0"
#   create_namespace = true

#   namespace = "ingress-nginx"

#   set {
#     name  = "controller.replicaCount"
#     value = "2"
#   }

#   set {
#     name  = "controller.service.type"
#     value = "LoadBalancer"
#   }
# }

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  create_namespace = true
  version    = "v1.14.3"

  namespace = "cert-manager"

  set {
    name  = "installCRDs"
    value = "true"
  }
}