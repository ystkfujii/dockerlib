sed -i '/proxy_module/ s/\#//' /usr/local/httpd/conf/httpd.conf
sed -i '/proxy_ajp_module/ s/\#//' /usr/local/httpd/conf/httpd.conf
echo 'ProxyPass / ajp://ap-'${dmnum}':8009/' >> /usr/local/httpd/conf/httpd.conf
