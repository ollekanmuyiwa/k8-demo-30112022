
terraform {
  required_providers {
    kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "kubectl" {
  config_path = "~/.kube/config"
}

# Create a ClusterIssuer

resource "kubectl_manifest" "cloudflare_staging" {
    yaml_body = <<YAML
---
apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-token-secret
  namespace: cert-manager
type: Opaque
stringData:
  cloudflare-token: Ehh_gu6ak-LWe_cnDViUtzoFlL-QTXSfhDlu70UM
    YAML
}