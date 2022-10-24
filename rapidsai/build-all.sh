#! /bin/bash

#1-x86_64-base-developer-image
docker build -t quay.io/rhcsdel/base-developer-image:ubi8-latest 1-x86_64-base-developer-image/
docker push quay.io/rhcsdel/base-developer-image:ubi8-latest

#2-x86_64-universal-developer-image
docker build -t quay.io/rhcsdel/universal-developer-image:ubi8-latest developer-images/universal/ubi8/
docker push quay.io/rhcsdel/universal-developer-image:ubi8-latest

#3-x86_64-cuda-base
docker build -t quay.io/rhcsdel/universal-developer-image:11.5.2-base-ubi8 3-x86_64-cuda-base/
docker push quay.io/rhcsdel/universal-developer-image:11.5.2-base-ubi8

#4-x86_64-cuda-runtime
docker build --build-arg IMAGE_NAME=quay.io/rhcsdel/universal-developer-image -t quay.io/rhcsdel/universal-developer-image:11.5.2-runtime-ubi8 4-x86_64-cuda-runtime/
docker push quay.io/rhcsdel/universal-developer-image:11.5.2-runtime-ubi8

#5-x86_64-cuda-devel
docker build --build-arg TARGETARCH=amd64 --build-arg IMAGE_NAME=quay.io/rhcsdel/universal-developer-image -t quay.io/rhcsdel/universal-developer-image:11.5.2-devel-ubi8 5-x86_64-cuda-devel/
docker push quay.io/rhcsdel/universal-developer-image:11.5.2-devel-ubi8

#6-x86_64-cuda-devel-cudnn8
docker build --build-arg TARGETARCH=amd64 --build-arg IMAGE_NAME=quay.io/rhcsdel/universal-developer-image -t quay.io/rhcsdel/universal-developer-image:11.5.2-devel-cudnn8-ubi8 6-x86_64-cuda-devel-cudnn8/
docker push quay.io/rhcsdel/universal-developer-image:11.5.2-devel-cudnn8-ubi8


