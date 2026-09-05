image := "jahrik/arm-visualizer"
tag := "aarch64"

# Build the image locally
[group('build')]
build image_name=image image_tag=tag:
    docker build -t {{ image_name }}:{{ image_tag }} .

# Push the image to its default registry
[group('build')]
push image_name=image image_tag=tag:
    docker push {{ image_name }}:{{ image_tag }}

# Deploy the compose stack to the swarm
[group('deploy')]
deploy:
    docker stack deploy --resolve-image=never -c docker-compose.yml viz
