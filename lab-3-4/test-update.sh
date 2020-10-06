#!/bin/bash

while true; do
a=$(( ( RANDOM % 2 ) ))
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
POD_NAME=$(kubectl get pod -l tier=frontend -n lab-3 -o jsonpath={.items[$a].metadata.name})
kubectl exec -it $POD_NAME -n lab-3 -- nginx -v
POD_NAME=$(kubectl get pod -l tier=frontend -n lab-3 -o jsonpath={.items[$(( (a+1) %2 ))].metadata.name})
kubectl exec -it $POD_NAME -n lab-3 -- nginx -v
echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
done
