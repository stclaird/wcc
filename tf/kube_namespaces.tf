resource "kubernetes_namespace" "example" {
  metadata {
    name = "sock-shop"
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}