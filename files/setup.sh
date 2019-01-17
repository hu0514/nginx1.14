#!/bin/bash
data_path=/data/nginx1.14
default_path=/home/wwwroot
if [ ! -d ${data_path} ];then
	mkdir -p ${data_path}
	cp -r ${default_path}/* ${data_path}
#	start_nginx
        if [ ! -f ${data_path}/conf/nginx.conf ];then
                rm -rf /usr/local/nginx/conf
                cp -a ${default_path}/conf/nginx.conf ${data_path}/conf/nginx.conf
                cp -r ${data_path}/conf /usr/local/nginx/
                chown -R www:www /usr/local/nginx/conf
                chown -R www:www ${data_path}
                exec /usr/bin/nginx -g "daemon off;"
        else
                rm -rf /usr/local/nginx/conf
                cp -r ${data_path}/conf /usr/local/nginx/
                chown -R www:www /usr/local/nginx/conf
                chown -R www:www ${data_path}
                exec /usr/bin/nginx -g "daemon off;"
        fi

else
	[ ! -d ${data_path}/logs ] && mkdir -p ${data_path}/logs
	[ ! -d ${data_path}/conf ] && cp -r ${default_path}/conf ${data_path}/conf
	[ ! -d ${data_path}/html ] && cp -r ${default_path}/html ${data_path}/
#	start_nginx
        if [ ! -f ${data_path}/conf/nginx.conf ];then
                rm -rf /usr/local/nginx/conf
                cp -a ${default_path}/conf/nginx.conf ${data_path}/conf/nginx.conf
                cp -r ${data_path}/conf /usr/local/nginx/
                chown -R www:www /usr/local/nginx/conf
                chown -R www:www ${data_path}
                exec /usr/bin/nginx -g "daemon off;"
        else
                rm -rf /usr/local/nginx/conf
                cp -r ${data_path}/conf /usr/local/nginx/
                chown -R www:www /usr/local/nginx/conf
                chown -R www:www ${data_path}
                exec /usr/bin/nginx -g "daemon off;"
        fi
fi

#function start_nginx() 
#{
#	if [ ! -f ${data_path}/conf/nginx.conf ];then
#		rm -rf /usr/local/nginx/conf
#		cp -a ${default_path}/conf/nginx.conf ${data_path}/conf/nginx.conf
#		cp -r ${data_path}/conf /usr/local/nginx/
#		chown -R www:www /usr/local/nginx/conf
#		chown -R www:www ${data_path}
#		echo "123"
#		exec /usr/bin/nginx -g "daemon off;"
#	else
#		rm -rf /usr/local/nginx/conf
#		cp -r ${data_path}/conf /usr/local/nginx/
#		chown -R www:www /usr/local/nginx/conf
##		chown -R www:www ${data_path}
#		echo "456"
#		exec /usr/bin/nginx -g "daemon off;"
#	fi
#}
#exec /usr/bin/nginx -g "daemon off;"
