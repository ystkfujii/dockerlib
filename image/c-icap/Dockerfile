FROM centos:7

# system update
RUN yum -y update && yum clean all

# set locale
RUN yum reinstall -y glibc-common && yum clean all
RUN unlink /etc/localtime && ln -s /usr/share/zoneinfo/Japan /etc/localtime

RUN yum -y install make gcc perl openssl-devel gcc-c++


#COPY ./src/* /opt/
RUN yum install -y wget && wget --content-disposition -P /opt https://sourceforge.net/projects/c-icap/files/latest/download
RUN tar zxvf /opt/c_icap-* -C /opt && cd /opt/c_icap-0.5.6/ && ./configure && make && make install && make clean

EXPOSE 1344

#USER squid
CMD ["/usr/local/bin/c-icap","-N -D"]
