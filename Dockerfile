FROM centos:7
RUN yum install -y epel-release
RUN yum install -y tinyproxy
# This is needed to allow global access to tinyproxy. See the comments in tinyproxy.conf 
# and tweak to your needs if you want something different.
RUN sed -i.bak -e s/^Allow/#Allow/ /etc/tinyproxy/tinyproxy.conf
ENTRYPOINT [ "/usr/sbin/tinyproxy", "-d", "-c", "/etc/tinyproxy/tinyproxy.conf" ]
