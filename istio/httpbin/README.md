### httpbin 구현

# istioctl로 설치하기
https://istio.io/latest/docs/setup/install/istioctl/ 
https://istio.io/latest/docs/setup/additional-setup/download-istio-release/

```bash
istioctl install
```
# default로 설치시 istiod, istio-gateway 설치됌

```bash
k apply -f gateway-virtualservice.yaml
k apply -f service-deployment.yaml
```

# host name 확인

```bash
(base) jmlim@jmlim-Lenovo-Legion-5-15ARH05:~$ cat /etc/hosts
127.0.0.1	localhost
127.0.1.1	jmlim-Lenovo-Legion-5-15ARH05
192.168.49.2	minikube.jmlim-cluster.com
```

# gateway/virtualservice host명 설정 X
```bash
curl -v minikube.jmlim-cluster.com:30998/status/200
curl -v minikube.jmlim-cluster.com:30998/delay/5
```

# gateway/virtualservice host명 설정 O
```bash
curl -v -H "Host: httpbin-jmlim.com" http://192.168.49.2:30998/status/200
curl -v -H "Host: httpbin-jmlim.com" http://192.168.49.2:30998/delay/5
```

