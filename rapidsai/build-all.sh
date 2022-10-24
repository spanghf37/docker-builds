#! /bin/bash

#1-x86_64-base-developer-image
docker build -t quay.io/rhcsdel/base-developer-image:almalinux8 1-x86_64-base-developer-image/
docker push quay.io/rhcsdel/base-developer-image:almalinux8-latest

#2-x86_64-universal-developer-image
docker build -t quay.io/rhcsdel/universal-developer-image:almalinux8-latest 2-x86_64-universal-developer-image/
docker push quay.io/rhcsdel/universal-developer-image:almalinux8-latest

#3-x86_64-cuda-base
docker build -t quay.io/rhcsdel/universal-developer-image:11.5.2-base-almalinux8 3-x86_64-cuda-base/
docker push quay.io/rhcsdel/universal-developer-image:11.5.2-base-almalinux8

#4-x86_64-cuda-runtime
docker build --build-arg IMAGE_NAME=quay.io/rhcsdel/universal-developer-image -t quay.io/rhcsdel/universal-developer-image:11.5.2-runtime-almalinux8 4-x86_64-cuda-runtime/
docker push quay.io/rhcsdel/universal-developer-image:11.5.2-runtime-almalinux8

#5-x86_64-cuda-devel
docker build --build-arg IMAGE_NAME=quay.io/rhcsdel/universal-developer-image -t quay.io/rhcsdel/universal-developer-image:11.5.2-devel-almalinux8 5-x86_64-cuda-devel/
docker push quay.io/rhcsdel/universal-developer-image:11.5.2-devel-almalinux8

#6-x86_64-cuda-devel-cudnn8
docker build --build-arg IMAGE_NAME=quay.io/rhcsdel/universal-developer-image -t quay.io/rhcsdel/universal-developer-image:11.5.2-devel-cudnn8-almalinux8 6-x86_64-cuda-devel-cudnn8/
docker push quay.io/rhcsdel/universal-developer-image:11.5.2-devel-cudnn8-almalinux8

#7-x86_64-miniforge-cuda-devel
docker build --build-arg IMAGE_NAME=quay.io/rhcsdel/universal-developer-image -t quay.io/rhcsdel/universal-developer-image:11.5.2-miniforge-cuda-devel-almalinux8 7-x86_64-miniforge-cuda-devel/
docker push quay.io/rhcsdel/universal-developer-image:11.5.2-miniforge-cuda-devel-almalinux8

