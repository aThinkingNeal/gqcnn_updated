FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu20.04

LABEL name="gqcnn" \
    maintainer="Tiancheng <athinkingneal@gmail.com>" \
    lastupdate="2024-01-08" 

# Args
# `work_dir` must be an absolute path.
ARG work_dir=/root/Workspace

# Make the working directory
WORKDIR ${work_dir}

# Set the timezone
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    vim \
    curl \
    wget \
    unzip \
    software-properties-common \
    libgl1-mesa-glx \
    libglu1-mesa && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.11

RUN apt-get update && apt-get install -y python3-distutils && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

# clone the repository
RUN git clone http://192.168.1.2:9080/star_robots/star_ai/gqcnn.git && \
    git checkout updated-gqcnn

# change the working directory to gqcnn repo
WORKDIR ${work_dir}/gqcnn

# create the virtual environment and install the libraries, including gqcnn library and requirements
RUN python3.11 -m venv venv && \
    . venv/bin/activate && \
    pip install -r requirements/test_requirements.txt && \
    pip install -e .

# download the models and unzip the GQ-Image-Wise model
RUN wget --content-disposition https://huggingface.co/WoodenHeart0214/gqcnn/resolve/main/model_zoo.zip?download=true && \
    unzip model_zoo.zip && \
    rm model_zoo.zip && \
    mv model_zoo/* models/ && \
    cd models && \
    unzip GQCNN-2.0.zip


