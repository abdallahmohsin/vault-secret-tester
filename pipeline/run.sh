#!/usr/bin/env bash
set -e

export VAULT_ADDR=http://127.0.0.1:8200
# export VAULT_TOKEN // stored as an env var

echo "Checking Vault health..."
curl -s $VAULT_ADDR/v1/sys/health >/dev/null

echo "Deploying application via Helm..."
helm upgrade --install vault-tester helm/vault-tester

kubectl get pods
