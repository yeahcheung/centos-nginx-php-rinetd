FROM daocloud.io/centos:6
MAINTAINER "Anton Zhang" <306561345@qq.com>

# install rinetd
RUN yum install -y gcc wget tar && wget http://www.boutell.com/rinetd/http/rinetd.tar.gz && tar -xf rinetd.tar.gz
WORKDIR rinetd
RUN makedir -p /usr/man/man8 && make && make install

COPY rinetd.conf /etc/rinetd.conf

EXPOSE 80

CMD ["rinetd"]

