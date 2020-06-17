#!/usr/bin/env bash
set -e


echo "WAAS Sample App Postdelete starting"

echo "Print kubectl client and server versions"
kubectl version

function delete_secure_configuration {
    #securebeat
    CONFIG_INFIX=$1
    set +e
    kubectl delete -n ${NAMESPACE} configmap ${NAMES_PREFIX}${CONFIG_INFIX}-ca-config
    kubectl delete -n ${NAMESPACE} secret ${NAMES_PREFIX}${CONFIG_INFIX}-client-secret
    set -e
}


result=$(kubectl get pods -n ${NAMESPACE} --selector=app.kubernetes.io/name=WAAS  --output=jsonpath={.items..metadata.name})

if [ -z "$result" ] ;then
    echo "DELETE" && delete_secure_configuration securebeat
else
    echo "DELETE canceled, other waas pods in use $result"
fi
echo "WAAS Sample App Postdelete complete"

