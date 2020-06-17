#/bin/bash

#set -x

function valid {
    kubectl get $1 $2 -n $3 -o go-template='{{ index .data }}' > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        kubectl get $1 $2 -n $4 -o go-template='{{ index .data }}' > /dev/null 2>&1
        if [ $? -eq 1 ]; then
            kubectl get $1 $2 -n $3 -o yaml | sed "s/namespace: $3/namespace: $4/" | kubectl apply -f -
            echo "$1 $2 in ns $4 copied"
        else
            echo "$1 $2 in ns $4 already  exists"
        fi
    else 
        echo "FAILED" && exit 1
    fi
}

function copy_certs {
    echo "Handling Copy Cerificates"
    CONFIG_INFIX=$1
    SECUREBEAT_CA_CONFIG=${NAMES_PREFIX}${CONFIG_INFIX}-ca-config
    SECUREBEAT_CLIENT_SECRET=${NAMES_PREFIX}${CONFIG_INFIX}-client-secret
    #set -e
    valid cm ${SECUREBEAT_CA_CONFIG} ${KWAFNAMESPACE} ${NAMESPACE}
    valid secret ${SECUREBEAT_CLIENT_SECRET} ${KWAFNAMESPACE} ${NAMESPACE}
    #set +e
    echo "copy_certs done [$(date +"%T")]"
    echo ""
}

echo "WAAS Copy Certificates starting"
echo ""

echo "Print kubectl client and server versions"
kubectl version
echo ""

echo "running for namespace ${NAMESPACE}"

echo "running as user: ${UID}"
echo ""

copy_certs securebeat

echo "WAAS Preinstall job complete"

exit 0