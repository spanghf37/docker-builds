#! /bin/bash

#1-x86_64-base-developer-image
docker build -t quay.io/rhcsdel/datascience-developer-image-base:22.10-cuda11.5-devel-centos7-py3.9 1-x86_64-base-developer-image/
docker push quay.io/rhcsdel/datascience-developer-image-base:22.10-cuda11.5-devel-centos7-py3.9

#2-x86_64-universal-developer-image
docker build -t quay.io/rhcsdel/datascience-developer-image:22.10-cuda11.5-devel-centos7-py3.9 2-x86_64-universal-developer-image/
docker push quay.io/rhcsdel/datascience-developer-image:22.10-cuda11.5-devel-centos7-py3.9

#3-x86_64-cuda-base
docker build -t quay.io/rhcsdel/datascience-developer-image-custom:22.10-cuda11.5-devel-centos7-py3.9-20221108 3-x86_64-universal-developer-image-datascience/
docker push quay.io/rhcsdel/datascience-developer-image-custom:22.10-cuda11.5-devel-centos7-py3.9-20221108
