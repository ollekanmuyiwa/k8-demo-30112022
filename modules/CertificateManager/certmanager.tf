
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



resource "kubernetes_namespace" "certmanager" {

  metadata {
    name = "cert-manager"
  }
}

resource "helm_release" "certmanager" {

  depends_on = [
    kubernetes_namespace.certmanager
  ]

  name      = "cert-manager"
  namespace = "cert-manager"

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"

  # Install Kubernetes CRDs
  set {
    name  = "installCRDs"
    value = "true"
  }
}

# Create a ClusterIssuer

resource "kubectl_manifest" "cloudflare_staging" {
    yaml_body = <<YAML
---
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    email: webmaster@azuragroup.com
    privateKeySecretRef:
      name: letsencrypt-staging
    solvers:
      - dns01:
          cloudflare:
            email: webmaster@azuragroup.com
            apiTokenSecretRef:
              name: cloudflare-token-secret
              key: cloudflare-token
        selector:
          dnsZones:
            - "azclients.co.uk"
    YAML
}