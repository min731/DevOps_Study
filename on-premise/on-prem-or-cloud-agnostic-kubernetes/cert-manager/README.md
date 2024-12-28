### Cert-Manager 구축

# 기본 개념
Cert-manager는 let's encrypt 활용 가능
domain 소유자임을 증명하면 ssl 발급
let's encrypt는 두달에 한번씩 갱신, 이를 확인하고 자동으로 갱신하는 cert-manager
namecheap.com / AWS route53 에서 도메인 구매
ssl이 발급되면 secret에 저장되고 ingress에서 사용 할 수 있음

# install nginx ingress

```
helm install --name my-ingress stable/nginx-ingress \
  --set controller.kind=DaemonSet \
  --set controller.service.type=NodePort \
  --set controller.hostNetwork=true
```

# start myapp

Create myapp and add an ingress rule:

(tls라는 ns에 설치)
```
kubectl create -f myapp.yml
kubectl create -f myapp-ingress.yml
```

# install cert-manager

(helm으로 설치)

```(수정)
# Helm 리포지토리 추가 및 업데이트
helm repo add jetstack https://charts.jetstack.io
helm repo update

# CRD 설치
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.3/cert-manager.crds.yaml

# cert-manager 네임스페이스 생성
kubectl create namespace cert-manager

# cert-manager 설치
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.13.3

# 설치 확인
kubectl get pods -n cert-manager
```


```
helm install \
    --name cert-manager \
    --namespace kube-system \
    stable/cert-manager
```
