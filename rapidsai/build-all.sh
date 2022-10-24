#! /bin/bash

docker build -t quay.io/rhcsdel/base-developer-image:ubi8-latest developer-images/base/ubi8/
docker push quay.io/rhcsdel/base-developer-image:ubi8-latest

docker build -t quay.io/rhcsdel/universal-developer-image:ubi8-latest developer-images/universal/ubi8/
docker push quay.io/rhcsdel/universal-developer-image:ubi8-latest

#1-x86_64-cuda-base
export TARGETARCH=amd64
docker build -t quay.io/rhcsdel/base-developer-image:11.5.2-base-ubi8 1-x86_64-cuda-base/

#2-x86_64-cuda-runtime
export TARGETARCH=amd64
docker build -t quay.io/rhcsdel/base-developer-image:11.5.2-base-ubi8 2-x86_64-cuda-runtime/
