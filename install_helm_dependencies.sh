# Traefik dependencies
cd ./Helm/Traefik
helm repo add traefik https://traefik.github.io/traefik-helm-chart
helm dependency build
cd ../..

# Prometheus-Stack dependencies
cd ./Helm/Prometheus-Stack
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm dependency build
cd ../..
