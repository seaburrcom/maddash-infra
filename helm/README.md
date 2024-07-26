# Basic Loki/Promtail Deployment

This deploys a single monolithic Loki node along with promtail to collecting k8s logs and shipping them to Loki. If needed, Grafana can be deployed as well.

```sh
# Create a namespace for loki (not required).

# Install Grafana (not required).
helm install grafana/grafana

# w/ Namespace
helm install grafana/grafana --namespace <NAMESPACE>

# Install Loki monolithic.
cd helm/loki/
helm install --values values.yaml loki grafana/loki  # Loki should be available @ http://loki:3100

# Install promtail. NOTE override in values.yaml that changes loki endpoint, no other changes.
cd helm/promtail
helm install --values values.yaml promtail grafana/promtail
```

## Links
* https://akyriako.medium.com/kubernetes-logging-with-grafana-loki-promtail-in-under-10-minutes-d2847d526f9e