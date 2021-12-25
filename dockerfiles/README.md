# Dockerfiles

```bash
$ docker buildx ls
NAME/NODE       DRIVER/ENDPOINT STATUS  PLATFORMS
desktop-linux   docker
  desktop-linux desktop-linux   running linux/arm64, linux/amd64, linux/riscv64, linux/ppc64le, linux/s390x, linux/386, linux/arm/v7, linux/arm/v6
default *       docker
  default       default         running linux/arm64, linux/amd64, linux/riscv64, linux/ppc64le, linux/s390x, linux/386, linux/arm/v7, linux/arm/v6

$ docker buildx create --name my_builder
my_builder

$ docker buildx use my_builder

$ docker buildx inspect --bootstrap
```

```bash
# example
$ cd php-fpm
$ docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t rayyounghong/php-fpm:latest --push .
```