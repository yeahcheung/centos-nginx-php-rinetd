FROM daocloud.io/centos:6
MAINTAINER "Anton Zhang" <306561345@qq.com>

# install nginx
RUN yum update -y && rpm -Uvh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm && yum install -y nginx 

# install php
RUN rpm -Uvh http://mirrors.ustc.edu.cn/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm && rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

RUN yum install --enablerepo=remi --enablerepo=remi-php56 -y php php-devel php-mbstring php-mcrypt php-pdo php-fpm php-cli php-gd php-common php-curl php-mysqlnd

RUN sed -i "s/daemonize = yes/daemonize = no/g" /etc/php-fpm.conf
RUN sed -i "s/user = apache/user = root/g" /etc/php-fpm.d/www.conf
RUN sed -i "s/group = apache/group = root/g" /etc/php-fpm.d/www.conf

RUN rm -f /etc/nginx/conf.d/default.conf
COPY default.conf /etc/nginx/conf.d/
COPY index.php /usr/share/nginx/html/

# install ssh
RUN yum install -y openssh-server
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN echo "root:001001"|chpasswd
RUN sed -i "s/UsePAM yes/UsePAM no/g" /etc/ssh/sshd_config

# install rinetd
RUN yum install -y gcc wget tar && wget http://www.boutell.com/rinetd/http/rinetd.tar.gz && tar -xf rinetd.tar.gz
WORKDIR rinetd
RUN mkdir -p /usr/man/man8 && make && make install

COPY rinetd.conf /etc/rinetd.conf

# install supervisor
RUN yum install -y python-setuptools
RUN easy_install supervisor

COPY supervisord.conf /etc/supervisord.conf


EXPOSE 80 22

CMD ["/usr/bin/supervisord"]
