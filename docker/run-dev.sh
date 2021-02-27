#!/bin/bash

docker run \
  --gpus all \
  -v /home/schsia/.cache:/home/schsia/.cache:ro \
  -v /group/brooks:/group/brooks:ro \
  -v /group/vlsiarch:/group/vlsiarch:rw \
  -v /group/vlsiarch/ugupta/docker_home/:/home/ugupta:rw \
  -v /etc/passwd:/etc/passwd:ro \
  -v /data/:/data/:rw \
  -it --rm --user $(id -u) dlrm_terabyte:gpu  /bin/bash