## Docker Basic Commands

Commands to run PostgreSQL, MySQL, MongoDB, and Redis can be found in the following sections.

Let's see how to build an image:

```bash
# Build an image from a Dockerfile
docker build -t somename:sometag ./
```

Now, let's see different ways to run an image:

```bash
# simply run the image (not dettached)
docker run blog:design

# run an instance detached
docker run blog:design -d

# run an instance detached
docker run --name blog-new-layout blog:design

# run the image associating a local port
# to a port in the instance created
docker run -p 4000:80 blog:design

# all together
docker run -p 4000:80 \
  --name blog-new-layout \
  -d blog:design

# shows all running instances
docker ps --all
```


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

## Redis Commands

```bash
docker run --name redis \
    -p 6379:6379 \
    -d redis

docker stop redis
docker rm redis
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
