FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

RUN apt-get update && apt-get install -y \
  git \
  emacs \
  tmux \
  python \
  python-pip

# Upgrade pip (already installed)
RUN pip install --upgrade pip

RUN pip install \
  future \
  numpy \
  onnx \
  pydot \
  torch==1.3.1 \
  torchviz \
  scikit-learn \
  tqdm \
  matplotlib

  WORKDIR /home/schsia/dlrm