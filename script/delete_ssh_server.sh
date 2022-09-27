#!/usr/bin/env bash
set -e

if ! helm list --short -n "$1" | grep -wq "ssh-server"; then
    echo "helm chart ssh-server not found in $1 namespace"
else
    helm delete ssh-server -n "$1"
fi