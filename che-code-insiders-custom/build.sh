#! /bin/bash

docker build -t quay.io/rhcsdel/che-code:insiders-custom-20221120 .
docker push quay.io/rhcsdel/che-code:insiders-custom-20221120
