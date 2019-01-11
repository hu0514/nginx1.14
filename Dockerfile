#base image
FROM centos

#yum install base package
RUN	\cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& yum install -y gcc gcc-c++ ncurses-devel libxml2-devel openssl-devel curl-devel libjpeg-devel libpng-devel autoconf pcre-devel libtool-libs freetype-devel gd zlib-devel zip unzip wget crontabs iptables file bison cmake patch mlocate flex diffutils automake make  readline-devel  glibc-devel glibc-static glib2-devel  bzip2-devel gettext-devel libcap-devel logrotate openssl expect \

#downlocal nginx into /mnt and unzip
	&& cd /mnt \
	&& wget http://nginx.org/download/nginx-1.14.2.tar.gz -O - | tar -xz \

#useradd www groupadd www
	&& groupadd www \
	&& useradd -m -s /sbin/nologin -g www www \

	&& mkdir /tmp/tcmalloc \
	&& chmod 0777 /tmp/tcmalloc \
	&& yum -y install libunwind gperftools \

	&& cd nginx-1.14.2 && ./configure --prefix=/usr/local/nginx --user=www --group=www --with-http_ssl_module  --with-http_gzip_static_module --without-http_scgi_module --with-http_stub_status_module --with-google_perftools_module && make &&make install \

	&& mkdir -p /home/wwwroot /usr/local/nginx/conf/vhost/ \
	&& ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx \
	&& mkdir /home/logs \
	&& touch /home/logs/nginx_error.log \
	&& chown www:www /home/logs/nginx_error.log \
	&& yum clean all \
	&& rm -rf /mnt/*
ADD ./files/nginx.conf /usr/local/nginx/conf/
ENTRYPOINT ["/usr/bin/nginx","-g","daemon off;"]
#EXPOSE 80
	




