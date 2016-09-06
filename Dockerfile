## Unifi Controller ##
FROM resin/rpi-raspbian 
MAINTAINER Amit Gandhi <amit@gandhi.co.nz> 

# based on instructions from http://www.lowefamily.com.au/2016/06/02/installing-ubiquiti-unifi-controller-5-on-raspberry-pi/3/
# and https://github.com/jacobalberty/unifi-docker/blob/master/unifi5/Dockerfile

VOLUME ["/var/lib/unifi", "/var/log/unifi", "/var/run/unifi", "/usr/lib/unifi/work"]

# Add the UniFi repository to the sources list
RUN echo 'deb http://www.ubnt.com/downloads/unifi/debian unifi5 ubiquiti' | sudo tee -a /etc/apt/sources.list.d/ubnt.list > /dev/null && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50 && \
  apt-get update

# Install UniFi
RUN apt-get -q update && \
  apt-get install -qy --force-yes unifi

RUN echo 'ENABLE_MONGODB=no' | sudo tee -a /etc/mongodb.conf > /dev/null

EXPOSE 8080/tcp 8081/tcp 8443/tcp 8843/tcp 8880/tcp 3478/udp

WORKDIR /var/lib/unifi

CMD ["/usr/bin/java", "-Xmx1024M", "-jar", "/usr/lib/unifi/lib/ace.jar", "start"]

