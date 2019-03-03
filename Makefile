IMAGE = "jahrik/arm-visualizer"
TAG = "arm32v7"

all: build

build:
	@docker build -t ${IMAGE}:$(TAG) .

push:
	@docker push ${IMAGE}:$(TAG)

deploy:
	@docker stack deploy --resolve-image=never -c docker-compose.yml viz

.PHONY: all build push deploy
