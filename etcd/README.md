# etcd

## HA Cluster
```
kops create cluster --name=kubernetes.newtech.academy --state=s3://kops-state-b429b --zones eu-west-1a,eu-west-1b,eu-west-1c --master-zones eu-west-1a,eu-west-1b,eu-west-1c --node-count=3 --node-size=t2.micro --master-size=t2.micro --dns-zone=kubernetes.newtech.academy
```

## Test backup
Create an object (wait 15 min after creating the object to make sure it the backup ran)
```
kubectl create configmap readme --from-file=README.md
```

## List backups
bash is not available anymore in this container image, so make sure you use "sh" instead of "bash"
```
kubectl exec -it etcd-main -n kube-system -- sh
./etcd-manager-ctl -backup-store=s3://kops-state-b429b/kubernetes.newtech.academy/backups/etcd/main/ list-backups
```

# 여러 etcd 간의 heartbeat 시간이 중요함
# snapshot 지원
# Raft consensus 알고리즘 사용
# 여러 노드 중 1개의 leader, 여러 follwer로 나뉨
# leader가 follwer들에게 주기적으로 heartbeat를 보내고 follwer들이 응답함
# 여러 노드 중 쿼럼(의사 결정에 필요한 최소 서버 수)에서 동의해야 작업 지속, 쿼럼에 도달한다면 노드는 동일한 정보를 갖게됌
# object가 생겼을 때 쿼럼의 충분한 응답이 있다면 전체 노드에서 응답하고 작성이 지속됌
