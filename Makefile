IMAGE = "jahrik/arm-visualizer"
TAG = "aarch64"

all: build

build:
	@docker build -t ${IMAGE}:$(TAG) .

push:
	@docker push ${IMAGE}:$(TAG)

deploy:
	@docker stack deploy --resolve-image=never -c docker-compose.yml viz

.PHONY: all build push deploy
