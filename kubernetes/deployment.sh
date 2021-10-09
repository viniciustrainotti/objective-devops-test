#!/bin/bash

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -ns|--namespace) namespace="$2"; shift ;;
        -os|--operating-system) os="$2"; shift ;;
        *) echo "Unknown parameter ns passed: $1"; exit 1 ;;
    esac
    shift
done

echo "It's OS to deployment: $os"

if [ "$os" = "linux" ]; then
    if [[ $namespace == *"app"* ]]; then
        kubectl create ns $namespace
        echo "It's namespace to deployment: $namespace"
        echo "Inicialize create deployment process ..."
        kubectl apply -f App-deployment-dockerhub.yaml --namespace=$namespace
        echo "Inicialize create service process ..."
        kubectl apply -f App-service-dockerhub.yaml --namespace=$namespace
        kubectl get services --namespace=$namespace --field-selector metadata.name=objective-devops-test-dockerhub-service
        minikube ip
        ip=$(minikube ip)
        echo "Acesse no navegador http://$ip:30009"
    else
        echo "Non-standard parameter: $namespace"
        exit 1;     
    fi
else 
    if [[ $namespace == *"app"* ]]; then
        kubectl create ns $namespace
        echo "It's namespace to deployment: $namespace"
        echo "Inicialize create deployment process ..."
        kubectl apply -f App-deployment-dockerhub.yaml --namespace=$namespace
        echo "Inicialize create service process ..."
        kubectl apply -f App-service-dockerhub.yaml --namespace=$namespace
        kubectl get services --namespace=$namespace --field-selector metadata.name=objective-devops-test-dockerhub-service
        minikube service --url objective-devops-test-dockerhub-service --namespace=$namespace
    else
        echo "Non-standard parameter: $namespace"
        exit 1;     
    fi
fi
