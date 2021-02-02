FROM centos:7

# system update
RUN yum -y update && yum clean all

# set locale
RUN yum reinstall -y glibc-common && yum clean all
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

ADD ./src/apache-tomcat-8.5.50.tar.gz /opt/

RUN cp -r /opt/apache-tomcat-8.5.50 /usr/local/tomcat


EXPOSE 8009 8080


CMD ["/usr/local/tomcat/bin/catalina.sh","run"]
