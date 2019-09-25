# docker-mongodb-exporter
A MongoDB Prometheus exporter based on [Pecorna's MongoDB Exporter](https://github.com/percona/mongodb_exporter)

## Usage
### Docker compose
```
version: '3'
  services:
[...]
    mongo-exporter:
      image: pandry/mongo-exporter
      restart: unless-stopped
      container_name: mongodb-exporter
      hostname: mongodb-exporter
      ports:
        - "9216:9216/tcp"
      command:
        - "--collect.database"
        - "--collect.collection"
        - "--collect.connpoolstats"
        - "--mongodb.uri=mongodb://user:password@node01.mongos.db.prod.example.com:27017
      networks:
        - mongonet
[...]
```


### Docker run
```
docker run -d \
--hostname mongo-exporter \
--name mongo-exporter \
--restart unless-stopped \
-p "9216:9216/tcp" \
\
pandry/mongodb-exporter \
--collect.database \
--collect.collection \
--collect.connpoolstats \
--mongodb.uri=mongodb://user:password@node01.mongos.db.prod.example.com:27017
``` 
