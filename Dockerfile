FROM continuumio/miniconda3:22.11.1
MAINTAINER Alexander Paul <alex.paul@wustl.edu>

LABEL \
  version="1.0.0" \
  description="Image for scAllele(https://github.com/gxiaolab/scAllele)"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gcc \
    git \
    wget \
    vim \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

COPY env.yml /opt/env.yml
RUN conda env create -n scAllele -f env.yml
