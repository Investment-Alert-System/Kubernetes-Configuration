resource "kubernetes_persistent_volume_claim" "stock_data_importer_pvc" {
    metadata {
      name = "stock-data-importer-pvc"
      namespace = "stock-data-importer"
    }

    spec {
      access_modes = ["ReadWriteMany"]
      resources {
        requests = {
           storage = "10Gi"
        }
      }
    }
}