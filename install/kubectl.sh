#!/usr/bin/env sh
set -e

VERSION=${VERSION:-$(curl -L -s https://dl.k8s.io/release/stable.txt)}
URL="https://dl.k8s.io/release/$VERSION/bin/linux/amd64/kubectl"

curl -LOfs "${URL}"
curl -LOfs "${URL}.sha256"
echo "$(cat kubectl.sha256) kubectl" | sha256sum -c -
chmod +x kubectl
mv kubectl /usr/local/bin/
