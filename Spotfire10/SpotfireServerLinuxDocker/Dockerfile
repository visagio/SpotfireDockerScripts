# This is a simplified version of the script that does not support config.
# Config should be done mannualy after container is started.
# Previous method didn't work because database was not accessible at docker build time 

# Indicates that the centos image will be used as the base image.
FROM centos

# Metadata indicating an image maintainer.
LABEL authors ="pmckinni@tibco.com, bruno.medeiros@visagio.com"

# Set during build and also for container
ARG SPOTFIRE_VERSION
ENV SPOTFIRE_VERSION=$SPOTFIRE_VERSION

# Copy over files that are needed all at once in case some files are missing
# Spotfire.Dxp.sdn and tss_simpleconfig.txt are ONLY needed for initial configuration and setup items
COPY tss-$SPOTFIRE_VERSION.x86_64.rpm run.sh ./

## Before using rpm need wget and unzip; dos2unix needed to convert fixservername.sh file
RUN yum -y install wget unzip dos2unix

# install Spotfire Server
RUN rpm -ivh tss-$SPOTFIRE_VERSION.x86_64.rpm
# configure Spotfire Server
RUN /opt/tibco/tss/$SPOTFIRE_VERSION/configure -d -s 80 -r 9080 -b 9443

# fix line endings on fixservername.sh
RUN dos2unix run.sh
RUN chmod 755 run.sh 

EXPOSE 80
EXPOSE 9443
EXPOSE 9080

# Sets a command or process that will run each time a container is run from the new image.
## Need to create bootstrap when docker container is created
ENTRYPOINT ./run.sh
