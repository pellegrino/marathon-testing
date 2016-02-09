
# Marathon testing

Based on the tutorial http://docs.mesosphere.com/intro-course/ex16.html, but using ubuntu 14.04 instead of centos. 

`vagrant up` - uses ansible to create a mesos cluster with a few services configured. 

## Node1:

It is the mesos master. Has the following services installed at each port: 
192.168.33.10:5050 -> mesos master
192.168.33.10:8080 -> marathon 
192.168.33.10:4400 -> chronos

## Nodes 2,3,4 

These are the mesos slaves. 

192.168.33.11
192.168.33.12
192.168.33.13

## Mesos dns

It has some basic service discovery built using [mesos dns](http://mesosphere.github.io/mesos-dns/docs/). Marathon will make sure the service is running correctly and in the master node. 

### Example 

The command below will return all the services running the application "outyet"  in marathon:

dig @192.168.33.10  _outyet._tcp.marathon.mesos  SRV

; <<>> DiG 9.10.2 <<>> @192.168.33.10 _outyet._tcp.marathon.mesos SRV
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 18650
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 4

;; QUESTION SECTION:
;_outyet._tcp.marathon.mesos. IN  SRV

;; ANSWER SECTION:
_outyet._tcp.marathon.mesos. 60 IN  SRV 0 0 31000 outyet-15067-s3.marathon.mesos.
_outyet._tcp.marathon.mesos. 60 IN  SRV 0 0 31000 outyet-56301-s1.marathon.mesos.
_outyet._tcp.marathon.mesos. 60 IN  SRV 0 0 31001 outyet-35878-s3.marathon.mesos.
_outyet._tcp.marathon.mesos. 60 IN  SRV 0 0 31000 outyet-40175-s2.marathon.mesos.

;; ADDITIONAL SECTION:
outyet-35878-s3.marathon.mesos. 60 IN A 192.168.33.13
outyet-40175-s2.marathon.mesos. 60 IN A 192.168.33.12
outyet-56301-s1.marathon.mesos. 60 IN A 192.168.33.11
outyet-15067-s3.marathon.mesos. 60 IN A 192.168.33.13

;; Query time: 0 msec
;; SERVER: 192.168.33.10#53(192.168.33.10)
;; WHEN: Sun May 03 13:22:38 CEST 2015
;; MSG SIZE  rcvd: 537
