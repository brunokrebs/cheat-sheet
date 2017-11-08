## PostgreSQL Commands

```bash
docker run --name postgres \
    -p 5432:5432 \
    -e POSTGRES_DB=some-database \
    -e POSTGRES_PASSWORD=mysecretpassword \
    -d postgres

docker stop postgres
docker rm postgres
```

## MongoDB Commands

```bash
docker run --name mongo \
    -p 27017:27017 \
    -d mongo

docker stop mongo
docker rm mongo
```

## MySQL Commands

```bash
docker run --name mysql \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=myextremellysecretpassword \
    -e MYSQL_DATABASE=node-1 \
    -e MYSQL_USER=app-mysql \
    -e MYSQL_PASSWORD=mysecretpassword \
    -d mysql:5.7

docker stop mysql
docker rm mysql
```
