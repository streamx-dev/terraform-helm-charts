#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

IMAGES=$(docker exec -it streamx-control-plane crictl images | awk '{print $1":"$2}' | tail -n +2 | grep -v '<none>' | grep -v 'registry.k8s.io' | grep -v 'quay.io/kiwigrid/k8s-sidecar' | grep -v 'europe-west1-docker.pkg.dev/streamx-releases/streamx-docker-snapshots' | grep -v 'docker.io/kindest' | sort -u)

for img in $IMAGES; do
  docker pull $img
done

docker save $IMAGES -o "${SCRIPT_DIR}/kind-all-images.tar"