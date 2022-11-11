# Apply kubectl deployment
kubectl apply -f deployment.yaml

# Create HPA
kubectl apply -f hpa.yaml

# Increase load
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://calc-api; done"

# Watch autoscaling
kubectl get hpa calc-api --watch