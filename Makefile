.PHONY: build push test-deploy test-redeploy
build:
	cd docker && docker-compose build
push:
	cd docker && docker-compose push
test-deploy:
	kubectl apply -f k8s/
test-redeploy:
	-@kubectl delete -f k8s/meshrc-cm.yaml
	-@kubectl delete -f k8s/pod.yaml
	-@kubectl apply -f k8s/pod.yaml
	-@kubectl apply -f k8s/meshrc-cm.yaml
	kubectl logs mesh mesh -f

	