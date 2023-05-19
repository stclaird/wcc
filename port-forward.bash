#!/bin/bash
echo "Port Forward Promtheus"
kubectl port-forward svc/kube-prometheus-stackr-prometheus 9090:9090 -n monitoring & \

echo "Port Forward Node Exporter"
kubectl port-forward svc/kube-prometheus-stackr-prometheus-node-exporter 9100:9100 -n monitoring & \

echo "Port Forward Grafana"
kubectl port-forward svc/kube-prometheus-stackr-grafana 3000:80 --namespace monitoring & \


echo "Port Forward Ingress Nginx 9901"
kubectl port-forward svc/nginx-prom-metrics 9901:9901 --namespace ingress-nginx & \