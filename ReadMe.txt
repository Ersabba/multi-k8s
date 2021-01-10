Se si resetta il cluster bisogna lanciare due comandi:

1. Installazione di Ingres Controller

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.43.0/deploy/static/provider/cloud/deploy.yaml

2. Creazione del secret per la password del database

kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf