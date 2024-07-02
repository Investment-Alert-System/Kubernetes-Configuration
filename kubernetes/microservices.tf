variable "microservices" {
  type = list(string)
  description = "Microservices to deploy"
  default = [
    "investment-alert-frontend",
    "stock-data-streamer",
    "traefik",
    "prometheus"
  ]
}