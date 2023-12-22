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
    python-software-properties \
    libgl1-mesa-glx \
    libglu1-mesa 

# Add the deadsnakes PPA, update package list, and install Python 3.6
RUN add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get update && \
    apt-get install -y python3.6

# Download get-pip.py and install pip for Python 3.6
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.6 get-pip.p

# clone the local gqcnn repo
RUN git clone http://192.168.1.2:9080/star_robots/star_ai/gqcnn.git

WORKDIR ${work_dir}/gqcnn

# create the virtual environment and install the libraries, including gqcnn library and requirements
RUN python3.6 -m venv venv && \
    . venv/bin/activate && \
    pip install -r requirements/gpu_requirements.txt && \
    pip install -e .

