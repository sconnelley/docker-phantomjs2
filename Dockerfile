FROM ubuntu:lucid
MAINTAINER Sean Connelley "connelley@stamen.com"

RUN apt-get -q update
RUN apt-get -q -y install python-software-properties
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get -q update

RUN apt-get -q -y install git-core curl g++-4.6 gcc-4.6 flex bison gperf ruby perl \
  libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev wget unzip python-pip

RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.6 20
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 20
RUN update-alternatives --config g++
RUN update-alternatives --config gcc

RUN pip install awscli

COPY build home/build
CMD ./home/build