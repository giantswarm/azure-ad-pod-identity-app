#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

ROOT_DIR="./$(dirname "$0")/.."
ROOT_DIR="$(realpath "$ROOT_DIR")"
KUSTOMIZE_CRD_DIR="$ROOT_DIR/helm/azure-ad-pod-identity-app/files"
HELM_DIR="$ROOT_DIR/helm/azure-ad-pod-identity-app"
KUSTOMIZE_INPUT_DIR="$ROOT_DIR/config/helm/input"

# Download upstream manifests
helm_values="$HELM_DIR/values.yaml"
org="Azure"
repo="azure-ad-pod-identity-app"
version="$(yq e '.image.tag' "$helm_values")"
release_deployment_filename="deployment-rbac.yaml"
exception_cr_filename="mic-exception.yaml"
deployment_file_url="https://github.com/$org/$repo/releases/download/$version/$release_deployment_filename"
exception_cr_file_url="https://github.com/$org/$repo/releases/download/$version/$exception_cr_filename"
mkdir -p "$KUSTOMIZE_INPUT_DIR"
curl -L "$url" -o "$KUSTOMIZE_INPUT_DIR/$release_deployment_filename"
curl -L "$url" -o "$KUSTOMIZE_INPUT_DIR/$exception_cr_filename"

