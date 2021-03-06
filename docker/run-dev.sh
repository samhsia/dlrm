#!/bin/bash

nvidia-docker run \
  -v /home/schsia:/home/schsia:rw \
  -v /home/schsia/.cache:/home/schsia/.cache:ro \
  -v /group/brooks:/group/brooks:ro \
  -v /group/vlsiarch:/group/vlsiarch:rw \
  -v /etc/passwd:/etc/passwd:ro \
  -v /data/:/data/:rw \
  -it --rm --user $(id -u) dlrm_terabyte:gpu  /bin/bash