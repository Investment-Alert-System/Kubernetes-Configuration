# Grafana
## gat grafana secrets
```shell
kubectl get secret prometheus-stack-grafana -n default -o jsonpath="{.data.admin-user}" | base64 --decode
kubectl get secret prometheus-stack-grafana -n default -o jsonpath="{.data.admin-password}" | base64 --decode
```

