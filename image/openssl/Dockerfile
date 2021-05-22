ARG SEVNUM

FROM centos:7

RUN yum -y install perl wget gcc make perl-IPC-Cmd perl-Data-Dumper

RUN cd /usr/local/src && \
  wget https://www.openssl.org/source/old/1.0.2/openssl-1.0.2u.tar.gz && \
  tar zxvf openssl-1.0.2u.tar.gz && rm -f openssl-1.0.2u.tar.gz && cd openssl-1.0.2u && \
  ./config --prefix=/usr/local/ssl102u shared && make depend && make && make install && make clean

RUN cd /usr/local/src && \
  wget https://www.openssl.org/source/old/1.1.1/openssl-1.1.1j.tar.gz && \
  tar zxvf openssl-1.1.1j.tar.gz && rm -f openssl-1.1.1j.tar.gz && cd openssl-1.1.1j && \
  ./config --prefix=/usr/local/ssl111j shared && make depend && make && make install && make clean

RUN cd /usr/local/src && \
  wget https://www.openssl.org/source/old/3.0/openssl-3.0.0-alpha16.tar.gz && \
  tar zxvf openssl-3.0.0-alpha16.tar.gz && rm -f openssl-3.0.0-alpha16.tar.gz && cd openssl-3.0.0-alpha16 && \
  ./config --prefix=/usr/local/ssl300a16 shared && make depend && make && make install && make clean

RUN echo /usr/local/ssl102u/lib >> /etc/ld.so.conf.d/local.conf && \
  echo /usr/local/ssl111j/lib   >> /etc/ld.so.conf.d/local.conf && \
  echo /usr/local/ssl300a16/lib >> /etc/ld.so.conf.d/local.conf && \
  ldconfig
