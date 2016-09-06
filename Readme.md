Docker setup to run the Ubiquiti Unifi Controller on a Raspberry Pi 2 (or above)

Set up is based on instructions from 
* http://www.lowefamily.com.au/2016/06/02/installing-ubiquiti-unifi-controller-5-on-raspberry-pi/3/
* https://github.com/jacobalberty/unifi-docker/blob/master/unifi5/Dockerfile

```
$ docker build -t unifi .
$ docker run --restart=always -d unifi
```
