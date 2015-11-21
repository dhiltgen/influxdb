ORG=dhiltgen
IMAGE=influxdb
TAG=latest

build:
	docker build -t $(ORG)/$(IMAGE)-dev:$(TAG) --file Dockerfile-dev .
	docker run --name $(IMAGE)-dev-tmp $(ORG)/$(IMAGE)-dev:$(TAG) sh
	docker cp $(IMAGE)-dev-tmp:/go/bin .
	docker rm $(IMAGE)-dev-tmp
	docker rmi $(ORG)/$(IMAGE)-dev:$(TAG)
	docker build -t $(ORG)/$(IMAGE):$(TAG) .

clean:
	rm -rf bin/
	docker rmi $(ORG)/$(IMAGE)-dev:$(TAG) || true
	docker rmi $(ORG)/$(IMAGE):$(TAG) || true

push:
	docker push $(ORG)/$(IMAGE):$(TAG)
