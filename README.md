# Telegraf InfluxDB Grafana Stack

## What is inside TIG Stack
* [Telegraf](https://hub.docker.com/r/matisq/telegraf/) - Gathers cpu,mem,net,docker data and sends it to InfluxDB
* [InfluxDB](https://hub.docker.com/r/matisq/influxdb/) + volume data - Stores data from Telegraf
* [Grafana](https://hub.docker.com/r/matisq/grafana/) + volume data - Includes one Dashboard (there will be more!) for docker monitoring.
 
## How to use it?
TIG stack is created for [Rancher](http://rancher.com/). If you are not fammiliar with rancher, please [read](http://rancher.com/rancher/) some docs, because it is really great Docker Orchestration Tool.  
To use it add custom [rancher-catalog](https://github.com/matisku/rancher-catalog) to the Rancher configuration, and within only one click, you are able to monitor your Docker Instance automatically!  

## What if I don't want to use Rancher?
You can obviously use this stack without Rancher. Just grab [docker-compose.yml](https://raw.githubusercontent.com/matisku/tig-stack/master/docker-compose.yml) file amd start your stack as usual.

## TODO
* Add more Grafs

## Metadata
* [![CircleCI](https://circleci.com/gh/matisku/tig-stack.svg?style=svg)](https://circleci.com/gh/matisku/tig-stack)  
* [matisq/telegraf](https://hub.docker.com/r/matisq/telegraf/) <a href="http://microbadger.com/images/matisq/telegraf" title="Get your own image badge on microbadger.com"><img src="https://images.microbadger.com/badges/image/matisq/telegraf.svg"></a>
* [matisq/influxdb](https://hub.docker.com/r/matisq/influxdb/) <a href="http://microbadger.com/images/matisq/influxdb" title="Get your own image badge on microbadger.com"><img src="https://images.microbadger.com/badges/image/matisq/influxdb.svg"></a>
* [matisq/grafana](https://hub.docker.com/r/matisq/grafana/) <a href="http://microbadger.com/images/matisq/grafana" title="Get your own image badge on microbadger.com"><img src="https://images.microbadger.com/badges/image/matisq/grafana.svg"></a>
