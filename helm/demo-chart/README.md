# Node demo app Chart

## Download dependencies
```
helm dependency update
```

## Install Chart
```
helm install .
```

## Upgrade Chart
```
helm upgrade --set image.tag=v0.0.2,mariadb.db.password=$DB_APP_PASS RELEASE .
```

## 차트 리스트
helm list 

## 버전업/다운 가능
helm upgrade ~
helm rollback

## 배포 히스토리 
helm history 