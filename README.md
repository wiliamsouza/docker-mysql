docker-mysql
------------

Docker mysql server generic image source. This is based on `ubuntu:12.04` image.

Image
-----

You can `pull` a ready to use image from Docker
[index](https://index.docker.io/u/wiliamsouza/) running:

```
$ docker.io pull wiliamsouza/mysql
```

Or build form this repository:

```
$ git clone https://github.com/wiliamsouza/docker-mysql.git
$ cd docker-mysql/
$ docker.io build -t wiliamsouza/mysql .
```

Change `wiliamsouza/mysql` to your Docker index username.

Container
---------

This image uses volumes and environment varibles to control the mysql server
configuration.

Volumes:

* `/etc/mysql/conf.d`: Change server configurations using it.
* `/var/lib/mysql`: Data goes here.
* `/var/log/mysql`: Access log from the container using it.

You pass with `-v` docker option. Don't forget to use absolute path here.

Environment variable:

* `MYSQL_ROOT_PASSWORD`: Root password.
* `MYSQL_DATABASE`: Database name.
* `MYSQL_USER`: If `MYSQL_DATABASE` is specified create a user.
* `MYSQL_PASSWORD`: Password for `MYSQL_USER`.
* `MYSQL_CHARACTER_SET`: Character set for `MYSQL_DATABASE`.
* `MYSQL_COLLATE`: Collate for `MYSQL_DATABASE`.
* `GRANT_HOSTNAME`: Hostname used on `GRANT` for `MYSQL_DATABASE`.

You pass with `-e` docker option.

Shell access:

```
$ docker.io run -p 3306:3306 -i \
-v /home/wiliam/devel/docker-mysql/data/log:/var/log/mysql \
-v /home/wiliam/devel/docker-mysql/data/mysql:/var/lib/mysql \
-v /home/wiliam/devel/docker-mysql/data/conf.d:/etc/mysql/conf.d \
-e MYSQL_ROOT_PASSWORD=12345 -e MYSQL_DATABASE=api -e MYSQL_USER=api \
-e MYSQL_PASSWORD=12345 -t wiliamsouza/mysql /bin/bash
```

The command above will start a container and starting a shell. Don't
forget to start the service running the `startup &` script.

Usage:

```
$ docker.io run --name mysql -p 3306:3306 -d \
-v /home/wiliam/devel/docker-mysql/data/log:/var/log/mysql \
-v /home/wiliam/devel/docker-mysql/data/mysql:/var/lib/mysql \
-v /home/wiliam/devel/docker-mysql/data/conf.d:/etc/mysql/conf.d \
-e MYSQL_ROOT_PASSWORD=12345 -e MYSQL_DATABASE=api -e MYSQL_USER=api \
-e MYSQL_PASSWORD=12345 -t wiliamsouza/mysql
```

The command above will start a container and return its ID.
