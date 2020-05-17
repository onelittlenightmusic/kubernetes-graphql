#!/bin/bash
helm repo add graphql-mesh https://onelittlenightmusic.github.io/graphql-mesh-docker/helm-chart
helm install graphql-mesh-k8s graphql-mesh/graphql-mesh -f helm-values.yaml