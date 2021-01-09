docker build -t lorenzodockerid/multi-client:latest -t lorenzodockerid/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t lorenzodockerid/multi-server:latest -t lorenzodockerid/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t lorenzodockerid/multi-worker:latest -t lorenzodockerid/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push lorenzodockerid/multi-client:latest
docker push lorenzodockerid/multi-server:latest
docker push lorenzodockerid/multi-worker:latest

docker push lorenzodockerid/multi-client:$SHA
docker push lorenzodockerid/multi-server:$SHA
docker push lorenzodockerid/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=lorenzodockerid/multi-server:$SHA
kubectl set image deployments/client-deployment client=lorenzodockerid/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=lorenzodockerid/multi-worker:$SHA