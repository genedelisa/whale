# my test thing
FROM ubuntu:latest
MAINTAINER Gene De Lisa (gene@rockhoppertech.com)


# some packages require timezone, which will launch
# in interactive mode and freeze the build. This says
# "don't do that."
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y update

RUN apt-get install -y --fix-missing \
    wget \
	make \
	vim \
	vim-gnome \
    curl

# Install git and process tools
RUN apt-get update && apt-get -y install git procps

# Install C++ tools
RUN apt-get -y install build-essential cppcheck valgrind

# this is ancient
# RUN apt-get -y install cmake
# get a modern cmake.
# warning: this takes a loooong time
RUN cd /usr/local/src \
    && wget https://cmake.org/files/LatestRelease/cmake-3.14.5.tar.gz \
    && tar xvf cmake-3.14.5.tar.gz \
    && cd cmake-3.14.5 \
    && ./bootstrap \
    && make \
    && make install \
    && cd .. \
    && rm -rf cmake*

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Set the default shell to bash instead of sh
ENV SHELL /bin/bash

# RUN cd ~ && \
#    mkdir -p mylib && \
#    git clone https://github.com/genedelisa/mlib.git mylib/ && \
#    cd  mylib/ && \


