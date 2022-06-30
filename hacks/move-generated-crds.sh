#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

# dirs
HELM_DIR="helm/azure-ad-pod-identity-app"
HELM_TEMPLATES_DIR="$HELM_DIR/templates"

move-crds() {
    CRD_BASE_DIR="$HELM_DIR/files"
    rm -f "./$CRD_BASE_DIR"/*
    mkdir -p "./$CRD_BASE_DIR"
    ls ${HELM_TEMPLATES_DIR}
    mv ${HELM_TEMPLATES_DIR}/apiextensions.k8s.io_v1_customresourcedefinition_*.aadpodidentity.k8s.io.yaml "./$CRD_BASE_DIR/"
    mv ${HELM_TEMPLATES_DIR}/aadpodidentity.k8s.io_v1_azurepodidentityexception_*.yaml "./$CRD_BASE_DIR/"

    cd "$CRD_BASE_DIR"
    for crd_file in apiextensions.k8s.io_v1_customresourcedefinition_*.aadpodidentity.k8s.io.yaml; do
        new_crd_file="$(echo "$crd_file" | cut -c50-)" # remove first 50 chars
        echo "$new_crd_file"
        mv "$crd_file" "$new_crd_file"
    done
    for crd_file in aadpodidentity.k8s.io_v1_azurepodidentityexception_*.yaml; do
        new_crd_file="$(echo "$crd_file" | cut -c52-)" # remove first 52 chars
        echo "$new_crd_file"
        mv "$crd_file" "$new_crd_file"
    done
    cd ../../../../..
}

move-crds
