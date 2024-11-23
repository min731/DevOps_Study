## Cluster에서 RBAC을 사용할 수 있게 실행
```bash
minikube start --extra-config=apiserver.Authorization.Mode=RBAC
```

## Retrieve keys from kops
```
aws s3 sync s3://kops-state-b429b/kubernetes.newtech.academy/pki/private/ca/ ca-key
aws s3 sync s3://kops-state-b429b/kubernetes.newtech.academy/pki/issued/ca/ ca-crt
mv ca-key/*.key ca.key
mv ca-crt/*.crt ca.crt
```
## Create new user
```
sudo apt install openssl
openssl genrsa -out edward.pem 2048
openssl req -new -key edward.pem -out edward-csr.pem -subj "/CN=edward/O=myteam/"
openssl x509 -req -in edward-csr.pem -CA ca.crt -CAkey ca.key -CAcreateserial -out edward.crt -days 10000
```

## add new context
```
kubectl config set-credentials edward --client-certificate=edward.crt --client-key=edward.pem
kubectl config set-context edward --cluster=kubernetes.newtech.academy --user edward
```
