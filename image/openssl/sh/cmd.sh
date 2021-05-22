openssl s_client -connect www.hogehoge.com:443
openssl s_client -connect www.hogehoge.com:443 -cipher ECDHE-ECDSA-AES256-GCM-SHA384 -tls1_2

openssl ciphers -v
