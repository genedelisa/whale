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
    curl

# Install git and process tools
RUN apt-get update && apt-get -y install git procps

# Install C++ tools
RUN apt-get -y install xz-utils build-essential cppcheck valgrind

# Install clang
RUN curl -SL http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz \
  | tar -xJC . && \
  mv clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04 /usr/local/clang_8.0.0 && \
  echo 'export PATH=/usr/local/clang_8.0.0/bin:$PATH' >> ~/.bashrc && \
  echo 'export LD_LIBRARY_PATH=/usr/local/clang_8.0.0/lib:LD_LIBRARY_PATH' >> ~/.bashrco

# this is ancient
# RUN apt-get -y install cmake
# get a modern cmake.
# warning: this takes a loooong time

# RUN cd /usr/local/src \
    # && wget https://cmake.org/files/LatestRelease/cmake-3.14.5.tar.gz \
    # && tar xvf cmake-3.14.5.tar.gz \
    # && cd cmake-3.14.5 \
    # && ./bootstrap \
    # && make \
    # && make install \
    # && cd .. \
    # && rm -rf cmake*

RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.5/cmake-3.14.5-Linux-x86_64.tar.gz \
&& tar xfv cmake-3.14.5-Linux-x86_64.tar.gz \
&& cd cmake-3.14.5-Linux-x86_64 \
&& mv bin/* /usr/local/bin \
&& mv doc/* /usr/local/doc \
&& mv man/* /usr/local/man \
&& mv share/* /usr/local/share

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

# Start Bash
CMD [ "/bin/bash" ]

