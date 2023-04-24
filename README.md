### Build docker file

```bash
docker image rm -f ipex_dev ; docker build -t ipex_dev .
```

### Run docker

```bash
# run docker
docker run --privileged -itd --name ipex_dev_run -v /home/gta:/home/gta ipex_dev

# into docker
docker exec -it ipex_dev_run /bin/bash

# stop docker
docker stop ipex_dev_run ; docker rm ipex_dev_run

# find docker
docker ps | grep ipex_dev_run
docker images | grep ipex_dev

# rm image
docker image rm xxxx
```
