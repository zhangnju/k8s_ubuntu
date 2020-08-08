#!/bin/bash

echo "Downloading K8S docker"

images=(  # 下面的镜像应该去除"k8s.gcr.io/"的前缀，版本换成上面获取到的版本
     kube-apiserver:v1.17.9
     kube-controller-manager:v1.17.9
     kube-scheduler:v1.17.9
     kube-proxy:v1.17.9
     pause:3.1
     etcd:3.4.3-0
     coredns:1.6.5
)

for imageName in ${images[@]} ; do
    docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
    docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName k8s.gcr.io/$imageName
    docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
done
