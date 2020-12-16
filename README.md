# ddn-docker
Dockerfile for ddn


## Building

```bash
docker build -t ddn .
```

## Running

```bash
# block dir
mkdir data
docker run --rm -itd --name ddn -p 8000:8000 -v `pwd`/data:/opt/data ddn
```

## Using snapshot
Download and extract to data dir: <http://releases.ddn.link/snapshots/db-20201120.tar.gz>


## Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/ddn/>:

```bash
docker run --rm -itd --name ddn -p 8000:8000 -v `pwd`/data:/opt/data mixhq/ddn
```
