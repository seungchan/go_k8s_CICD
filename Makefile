docker-login:
	aws ecr get-login-password --region $(AWS_REGION) --profile $(AWS_PROFILE) | \
	docker login --username AWS --password-stdin $(AWS_SERVER)

docker-build:
	docker build -f Dockerfile.multistage --no-cache -t echo-hello .

docker-tag:
	$(eval REV=$(shell git rev-parse HEAD | cut -c1-7))
	docker tag echo-hello:latest $(TAG_IMAGE):latest
	docker tag echo-hello:latest $(TAG_IMAGE):$(REV)

docker-push:
	$(eval REV=$(shell git rev-parse HEAD | cut -c1-7))
	docker push $(TAG_IMAGE):latest
	docker push $(TAG_IMAGE):$(REV)

docker-build-and-push: docker-login docker-build docker-tag docker-push 