docker build -t afnanqureshi11/multi-client:latest -t afnanqureshi11/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t afnanqureshi11/multi-server:latest -t afnanqureshi11/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t afnanqureshi11/multi-worker:latest -t afnanqureshi11/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push afnanqureshi11/multi-client:latest
docker push afnanqureshi11/multi-server:latest
docker push afnanqureshi11/multi-worker:latest
docker push afnanqureshi11/multi-client:$SHA
docker push afnanqureshi11/multi-server:$SHA
docker push afnanqureshi11/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=afnanqureshi11/multi-server:$SHA
kubectl set image deployments/client-deployment client=afnanqureshi11/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=afnanqureshi11/multi-worker:$SHA