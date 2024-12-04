# Helm

## Install helm
```
wget https://get.helm.sh/helm-v3.2.3-linux-amd64.tar.gz
```

Make sure to use the correct instructions below for the different helm versions. You can get the latest helm version from https://github.com/helm/helm/releases. If you want to install helm on Windows/MacOS then have a look at https://helm.sh/docs/intro/install/ for instructions.

## Initialize helm (helm >3.0)

Starting from 3.0, tiller has been removed. There is no need to create a service account for tiller anymore. The only command that is mandatory is the helm repo add command below:

```
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
```

## Setup S3 helm repository
Make sure to set the default region in setup-s3-helm-repo.sh
```
./setup-s3-helm-repo.sh
```

## Package and push demo-chart

```
export AWS_REGION=yourregion # if not set in ~/.aws
helm package demo-chart
helm s3 push ./demo-chart-0.0.1.tgz my-charts
```
## 명령어
helm init
helm reset
 
helm install
helm uninstall
helm delete

helm search

helm list

helm upgrade
helm rollback

# hub에서 검색
helm search hub redis
# repo 추가
helm repo add bitnami https://charts.bitnami.com/bitnami 
# repo 업데이트
helm repo update 
# repo 리스트
helm repo list

helm search repo redis
helm install my-redis bitnami/redis

# 특정 repo의 values.yaml 파일 보기
h show values bitnami/nginx > nginx-values.yaml
# values.yaml 수정해서 적용
helm install my-release bitnami/nginx -f my-values.yaml 
# 누적해서 적용도 가능, 공통 환경/개별 환경
helm install my-release bitnami/nginx -f values1.yaml -f values2.yaml

h get values my-nginx

# 커스텀 helm chart 만들기
h create my-chart # chart.yaml == 메타데이터 , values.yaml == 값 설정, templates/ deployment.yaml, service.yaml 템플릿

