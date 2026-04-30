# Quant-Net Docker

QUANT-NET Control Plane (QNCQ) runs as a distributed system. The QNCP containers lets users
run a controller and multiple agents for testing and tutorial purposes.

The tool "docker compose" with the file docker_compose.yml is used to 
- Build docker images from Dockerfiles or pull docker images from ghcr.io
- Run services on the target system. 

The QuantNet services include:
-  qn-server
-  qn-agent

Supporting services include:

- mongo
- mosquito-mqtt

## Build Docker Images (Optional)

Use the following command to build docker images from local dockerfiles.

```
docker compose -f docker-compose.yml build
```

## Start Services

```
docker compose -f docker-compose.yml up -d
```

 - Use a browser and navigate to http://localhost:8081 to view the web dashboard.

### Development testing

The `IMAGE_TAG` env var will provide access to the latest `develop` tagged docker images.

```
IMAGE_TAG=develop docker compose -f docker-compose.yml pull
IMAGE_TAG=develop docker compose -f docker-compose.yml up -d
```

## Run example pingpong test inside containers

 * Optionally view the QNCP Controller logging output:
```
docker logs controller -f
```

* Execute a pingpong test from within the controller container:
```
$ docker exec -ti controller bash
root@e038e8ec4071:/# cd /quant-net-plugins/plugins/pingpong/

root@e038e8ec4071:/quant-net-plugins/plugins/pingpong# HOST=broker python3 test_pingpong.py
--- LBNL-Q ping statistics ---
5 requests made, 5 received, time 5107ms
rtt min/avg/max/mdev 2.704/19.802/44.927/22.162 ms
message: Agent LBNL-Q is configured with the following drivers: exp_framework, lightsource, epc, polarimeter, egp, messaging
--- UCB-Q ping statistics ---
5 requests made, 5 received, time 5109ms
rtt min/avg/max/mdev 1.964/19.341/44.573/22.769 ms
message: Agent UCB-Q is configured with the following drivers: exp_framework, lightsource, epc, polarimeter, egp, messaging
--- agent2 ping statistics ---
5 requests made, 0 received, time 10009ms


root@e038e8ec4071:/quant-net-plugins/plugins/pingpong# HOST=broker python3 test_pingpong.py UCB-SWITCH
--- UCB-BSM ping statistics ---
5 requests made, 5 received, time 5234ms
rtt min/avg/max/mdev 43.232/45.056/47.463/1.772 ms
message: Agent UCB-BSM is configured with the following drivers: exp_framework, lightsource, epc, polarimeter, egp, messaging
```
