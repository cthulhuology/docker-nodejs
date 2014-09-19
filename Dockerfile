# docker-node
#
# VERSION 0.2

FROM centos:centos6
MAINTAINER wot.io devs <dev@wot.io>

# We need the developer tools to build the occasional add on or two
RUN yum -y groupinstall "Development Tools"

# Install EPEL6 for additional packages
RUN yum -y install http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm

# Fetch Nodejs 10.18
RUN curl -O http://nodejs.org/dist/v0.10.18/node-v0.10.18.tar.gz

# Untar source
RUN tar zxvf node-v0.10.18.tar.gz

# configure Nodejs
RUN cd node-v0.10.18 &&  ./configure

# build  Nodejs
RUN cd node-v0.10.18 && make

# install Nodejs
RUN cd node-v0.10.18 && make install

# setup pathing
RUN echo "export PATH=/usr/local/bin:/usr/local/sbin:$PATH" >> /etc/profile.d/nodejs.sh

# Cleanup
RUN rm -rf node-v0.10.18.tar.gz node-v0.10.18

# setup npm pathing
RUN echo 'export NODE_PATH="'$(npm root -g)'"' >> /etc/profile.d/npm.sh

# add a PS1 that makes sense
RUN echo 'export PS1="\u@\h $ "' >> /etc/profile.d/prompt.sh

# set the npm registry
RUN npm config set registry http://npm.wot.io:5984/registry/_design/app/_rewrite/

# Install common nodejs apps
RUN /usr/local/bin/npm install -g coffee-script@1.7.1
RUN /usr/local/bin/npm install -g supervisor@0.6.0
RUN /usr/local/bin/npm install -g request
RUN /usr/local/bin/npm install -g uuid
RUN /usr/local/bin/npm install -g mocha
RUN /usr/local/bin/npm install -g chai
RUN /usr/local/bin/npm install -g ws
RUN /usr/local/bin/npm install -g querystring

# startup with a commandline prompt
CMD /bin/bash -l
