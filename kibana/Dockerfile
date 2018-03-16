FROM centos:7.4.1708

# RUN yum update -y
# RUN yum -y install epel-release
# RUN yum -y install salt-minion

RUN yum clean all && \
    yum install -y yum install epel-release && \
    yum install -y "https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm"

RUN yum update -y && yum install -y salt-minion && yum clean all

EXPOSE 5601

#ENTRYPOINT ["/usr/bin/salt-minion"]
