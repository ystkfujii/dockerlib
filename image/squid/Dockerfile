FROM centos:7

# system update
RUN yum -y update && yum clean all

# set locale
RUN yum reinstall -y glibc-common && yum clean all
RUN unlink /etc/localtime && ln -s /usr/share/zoneinfo/Japan /etc/localtime

RUN yum -y install make gcc perl openssl-devel gcc-c++


#COPY ./src/* /opt/
RUN yum install -y wget && wget -P /opt http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.27.tar.gz && wget -P /opt https://www.openssl.org/source/old/1.0.2/openssl-1.0.2u.tar.gz

RUN tar zxvf /opt/squid* -C /opt && tar zxvf /opt/openssl* -C /opt

RUN cd /opt/openssl-1.0.2u && ./config --openssldir=/usr/local/ssl -fPIC shared && make && make install && make clean 
RUN sed -i "1i\/usr\/local\/ssl\/lib" /etc/ld.so.conf ; ldconfig



RUN useradd squid
RUN cd /opt/squid-3.5.27 && ./configure --prefix=/usr/local/squid  --with-openssl=/usr/local/ssl --with-default-user=squid && make && make install && make clean
RUN chown -R root:squid /usr/local/squid && chmod -R 775 /usr/local/squid

COPY ./etc/squid.conf /usr/local/squid/etc/

RUN mkdir -p /oss/squid/log && chown -R squid:squid /oss/squid


EXPOSE 3128

#USER squid
CMD ["/usr/local/squid/sbin/squid","-N"]
