FROM daocloud.io/centos:6
MAINTAINER "Anton Zhang" <306561345@qq.com>

RUN rpm -Uvh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm && \
	yum install -y nginx 

#VOLUME ["/var/cache/nginx"]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

