# Generate kustomize patches and all helm charts

.PHONY: generate
generate:
	@rm -rf helm/azure-ad-pod-identity-app/templates/*.yaml
	kustomize build config/helm -o helm/azure-ad-pod-identity-app/templates
	./hacks/move-generated-crds.sh
	./hacks/generate-kustomize-file.sh
