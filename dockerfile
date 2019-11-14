## MySQL 5.6 with Percona Xtrabackup
 
## Pull the mysql:5.6 image
FROM mysql-manoj-v2
 
## The maintainer name and email
#MAINTAINER Ashraf Sharif <ashraf@s9s.com>
 
## List all packages that we want to install
ENV PACKAGE percona-xtrabackup-23
 
# Install requirement (wget)
RUN apt-get update && apt-get install -y wget
 
# Install Percona apt repository and Percona Xtrabackup
RUN wget https://repo.percona.com/apt/percona-release_0.1-3.jessie_all.deb && \
    dpkg -i percona-release_0.1-3.jessie_all.deb && \
    apt-get update && \
    apt-get install -y $PACKAGE
 
# Create the backup destination
RUN mkdir -p /backup/xtrabackups
 
# Allow mountable backup path
VOLUME ["/backup/xtrabackup"]
