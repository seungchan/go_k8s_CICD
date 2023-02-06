# go_k8s_CICD

# Running echo app locally
```
cd echo
go run main.go
```

# Build Docker image
```
docker build --tag echo-hello .
docker image ls
```
## Tag images
```
docker image tag echo-hello:latest echo-hello:v1.0
```

## Delete image
```
docker image rm echo-hello:v1.0
```

# Multistage Docker build
```
docker build -t echo-hello:multistage -f Dockerfile.multistage .
```
Multistate build reduces image size signicantly. For more details, refer [distroless](https://github.com/GoogleContainerTools/distroless).

# Run docker image with host port map to container port
```
docker run -p 8080:8080 <IMAGE_ID>
```
You can access the app with curl command.
```
curl http://localhost:8080
```

# Build and Push Docker image to ECR with Makefile
```
export IMAGE=echo-hello
export AWS_PROFILE=aws-devops
export AWS_REGION=us-east-1
export AWS_ACCOUNT_ID=999999999999
export AWS_SERVER=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
export TAG_IMAGE=$AWS_SERVER/$IMAGE
make docker-build-and-push
```
Note: You have to set AWS_PROFILE, AWS_REGION, AS_ACCOUNT_ID based on your AWS account information.

# Deploy a docker image to EKS
After provisioning EKS, use the following command to update ~/.kube/config with cluster details.
```
$ aws eks --region <enter-your-region> update-kubeconfig --name <cluster-name>
```
Deploy a docker image to EKS with the following command
```
$ kubectl apply -f deployment.yml
$ kubectl get pods
NAME                         READY   STATUS    RESTARTS   AGE
echo-hello-f4f8dbddf-8nrcg   1/1     Running   0          5s
echo-hello-f4f8dbddf-mqgqw   1/1     Running   0          5s
echo-hello-f4f8dbddf-xzqwg   1/1     Running   0          5s
```

