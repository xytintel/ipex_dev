### Build docker file

```bash
docker build -t ipex_dev .
```

### Run docker

```bash
# run docker
docker run -itd --name ipex_dev_run -v /home/gta/intel:/home/gta/intel ipex_dev

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
