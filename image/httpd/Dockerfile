ARG SEVNUM

FROM centos:7


ARG dmnum="dm1"
# system update
RUN yum -y update && yum clean all

# set locale
RUN yum reinstall -y glibc-common && yum clean all
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

COPY ./sh/* /

RUN yum install -y wget && chmod -v +x /getsrc.sh && /getsrc.sh 
RUN tar zxvf /opt/squid* -C /opt

RUN yum -y install make gcc gcc-c++ expat-devel zlib zlib-devel
RUN mv /configure /opt/apr-1.7.0 && cd /opt/apr-1.7.0 && chmod 755 ./configure && ./configure --prefix=/usr/local/apr && make && make install && make clean
RUN cd /opt/apr-util-1.6.1 && ./configure --prefix=/usr/local/apr-util --with-apr=/usr/local/apr && make && make install && make clean
RUN cd /opt/pcre-8.44 && ./configure --prefix=/usr/local/pcre --disable-share --with-pic && make && make install && make clean

RUN cd /opt/httpd-2.4.46 && ./configure --prefix=/usr/local/httpd --with-apr=/usr/local/apr --with-apr-util=/usr/local/apr-util --with-pcre=/usr/local/pcre --enable-deflate \
      && make && make install && make clean


#ADD conf/httpd-proxy.conf /usr/local/httpd/conf/extra/
COPY sh/run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

COPY sh/mod_httpd.sh /mod_httpd.sh
RUN chmod -v +x /mod_httpd.sh ; /mod_httpd.sh $dmnum

EXPOSE 80

# editor install
#RUN yum install -y vim && yum clean all
CMD ["/run-httpd.sh"]
#CMD ["/usr/local/httpd/bin/apachectl","-D","FOREGROUND"]
