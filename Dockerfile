# docker-node
#
# VERSION 0.1

FROM centos
MAINTAINER Dave Goehrig dave@dloh.org

# We need the developer tools to build the occasional add on or two
RUN yum -y groupinstall "Development Tools"

# Install EPEL6 for additional packages
RUN yum -y install http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm

# Fetch Nodejs 10.18
RUN curl -O http://nodejs.org/dist/v0.10.18/node-v0.10.18.tar.gz


