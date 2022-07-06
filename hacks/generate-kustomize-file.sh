#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

# dirs
HELM_DIR="helm/azure-ad-pod-identity-app"
HELM_TEMPLATES_DIR="$HELM_DIR/templates"

create_crd_kustomize_file() {
  CRD_BASE_DIR="$HELM_DIR/files"
  pushd "$CRD_BASE_DIR"

  echo "resources: " > kustomization.yaml

  for crd_file in *.k8s.io.yaml; do
    echo "$crd_file"
    echo "  - $crd_file" >> kustomization.yaml
  done

  for crd_file in *exception.yaml; do
    echo "$crd_file"
    echo "  - $crd_file" >> kustomization.yaml
  done

  popd

}

create_crd_kustomize_file

