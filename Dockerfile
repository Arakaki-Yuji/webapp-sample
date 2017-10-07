FROM centos:6.9

RUN yum update -y

RUN yum install -y epel-release
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

RUN yum install -y httpd httpd-dev mod_ssl

RUN yum install -y --enablerepo=remi-php56 php php-mbstring php-mcrypt php-xml php-pdo php-mysqlnd php-gd

ADD ./docker/sample.conf /etc/httpd/conf.d/sample.conf
ADD . /var/www/html/webapp-sample

RUN chown -R apache:apache /var/www/html/webapp-sample

EXPOSE 80
ENTRYPOINT ["apachectl", "-DFOREGROUND"]
