# GraphQL endpoint of Kubernetes API; dynamically created by GraphQL Mesh

Simple setup for GraphQL Mesh to convert Kubernetes API server into GraphQL Mesh.

# Start up

```sh
# Create a Kubernetes cluster on Docker
kind create cluster --name kube-graphql

# Run containers on Kubernetes. 
kubectl apply -f k8s

# Forward GraphQL Mesh to local machine
kubectl port-forward svc/mesh-svc 4000:4000
```

Access `http://localhost:4000`.

Example: Pod listing

![](img/screen.png)

Example: document generated according to OpenAPI

![](img/readablemessage.png)

Error case

![](img/error.png)

# Cleanup

```sh
kubectl delete -f k8s
```

# Customize

Edit resources in `src` directory

```sh
src
├── .meshrc.yaml # Configuration file for GraphQL Mesh
├── example-query.graphql # Initial query to be shown in GraphQL Playground
└── mesh-init.sh # Initialization script for OpenAPI specification of Kubernetes
```

Compile into `k8s/meshrc-cm.yaml` with this command.

```sh
kubectl create cm meshrc-cm --from-file src/.meshrc.yaml --from-file src/mesh-init.sh --from-file src/example-query.graphql  --dry-run -o yaml> k8s/meshrc-cm.yaml
```

# Reference

- [GraphQL Mesh](https://github.com/Urigo/graphql-mesh)
- [GraphQL Mesh MySQL Employee example](https://github.com/Urigo/graphql-mesh/tree/master/examples/mysql-employees)
- [Kubernetes OpenAPI specification](https://github.com/kubernetes/kubernetes/tree/master/api/openapi-spec)