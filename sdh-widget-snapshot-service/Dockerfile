FROM alejandrofcarrera/phusion.node
MAINTAINER Alejandro Vera De Juan <xafilox@gmail.com>

#Install a required library for phantomjs
RUN apt-get -qq update && apt-get -qq -y install libfontconfig1 && apt-get clean

#Update npm
RUN npm install -g npm

# Configure runit
ADD ./my_init.d/ /etc/my_init.d/
ONBUILD ./my_init.d/ /etc/my_init.d/

RUN chmod u+x /etc/my_init.d/*

CMD ["/sbin/my_init"]

# Ports
EXPOSE 8888