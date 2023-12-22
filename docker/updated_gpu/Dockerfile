FROM meadml/cuda10.0-cudnn7-devel-ubuntu16.04-python3.6:latest

LABEL name="gqcnn" \
    maintainer="Tiancheng <athinkingneal@gmail.com>" \
    lastupdate="2023-12-22" 

# Args
# `work_dir` must be an absolute path.
ARG work_dir=/root/Workspace

# Make the working directory
WORKDIR ${work_dir}

# Update the package lists
RUN apt-get update

RUN apt-get install -y \
    build-essential \
    git \
    vim \
    curl \
    wget \
    unzip \
    software-properties-common \
    python-software-properties

# Add the deadsnakes PPA, update package list, and install Python 3.6
RUN add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get update && \
    apt-get install -y python3.6