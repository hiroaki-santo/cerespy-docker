FROM ubuntu:14.04
MAINTAINER Hiroaki Santo

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y build-essential cmake libgoogle-glog-dev libatlas-base-dev libeigen3-dev libsuitesparse-dev apt-file git vim wget unzip python-dev python-pip python-numpy python-matplotlib libopencv-dev python-opencv libboost-all-dev \
  && apt-file update && apt-get install -y software-properties-common \
  && add-apt-repository -y  ppa:bzindovic/suitesparse-bugfix-1319687 \
  && apt-get update && apt-get install -y libsuitesparse-dev \
  && apt-get autoclean \
  && apt-get autoremove \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /root
RUN git clone --depth=1 -b 1.13.0 https://ceres-solver.googlesource.com/ceres-solver
RUN cd ./ceres-solver && cmake . && make install

COPY ./hello_ceres ./hello_ceres


RUN git clone https://github.com/ndarray/Boost.NumPy
RUN cd ./Boost.NumPy && git checkout 5fa13be8f67af7480807256000ae3cfbf8a5ca6f && \
    cmake . && make install

ENV LD_LIBRARY_PATH="/usr/local/lib64:${LD_LIBRARY_PATH}"
COPY ./hello_boost_numpy ./hello_boost_numpy