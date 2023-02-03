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
Multistate build reduce image size signicantly. For more details https://github.com/GoogleContainerTools/distroless

# Run docker image with host port map to container port
```
docker run -p 8080:8080 <IMAGE_ID>
```