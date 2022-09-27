#!/usr/bin/env bash
set -e

# 公钥
id_rsa_pub=$(cat ~/.ssh/id_rsa.pub)

if [[ "$2" == "template" ]]; then
    helm template --set authorized_keys="${id_rsa_pub}" ssh-server --namespace "$1" manifest/ssh-server --output-dir yaml
else
    helm install --set authorized_keys="${id_rsa_pub}" ssh-server --namespace "$1" manifest/ssh-server
fi
    