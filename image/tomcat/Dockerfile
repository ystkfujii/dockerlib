FROM centos:7

# system update
RUN yum -y update && yum clean all

# set locale
RUN yum reinstall -y glibc-common && yum clean all
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

ADD ./src/apache-tomcat-8.5.50.tar.gz /opt/
#ADD ./src/jdk-13.0.1_linux-x64_bin.rpm /opt/

#RUN yum -y install make gcc gcc-c++ expat-devel zlib zlib-devel
#RUN rpm -i /opt/jdk-13.0.1_linux-x64_bin.rpm
RUN cp -r /opt/apache-tomcat-8.5.50 /usr/local/tomcat

#RUN rm -rf /usr/local/tomcat/webapps/ROOT && mkdir /usr/local/tomcat/webapps/ROOT
#ADD ./src/ROOT.war /usr/local/tomcat/webapps/ROOT/ 
#RUN cd /usr/local/tomcat/webapps/ROOT && jar -xvf ROOT.war && rm -f ROOT.war

#ADD ./conf/server.xml /usr/local/001/conf/

EXPOSE 8009 8080

# editor install
#RUN yum install -y vim && yum clean all

CMD ["/usr/local/tomcat/bin/catalina.sh","run"]
