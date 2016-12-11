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
```bash
$ mkdir tig-stack
$ cd tig-stack
$ curl -OL https://raw.githubusercontent.com/matisku/tig-stack/master/docker-compose.yml
$ docker-compose up -d
```

## Environment
### Grafana  
`GF_INSTALL_PLUGINS` - In default all plugins are installed  
`GF_SECURITY_ADMIN_USER` - Admin Username. Default: `admin`  
`GF_SECURITY_ADMIN_PASSWORD`- Admin User Password. Default:`admin`  
`GF_SECURITY_SECRET_KEY` - Secret key. Default: `grafana`  
`GF_USERS_ALLOW_SIGN_UP` - Allow singup to Grafana. Default: `"true"`  
`GF_USERS_ALLOW_ORG_CREATE` - Allow user create new Orgs. Default: `"true"`  
`GF_AUTH_ANONYMOUS_ENABLED` - Anonymus autthorization enabled. Default: `"true"`  
`GF_AUTH_ANONYMOUS_ORG_NAME` - Anonymus defaul Org Name. Default: `grafana`   
`GF_DASHBOARDS_JSON_ENABLED` - Dashboards as JSON enabled. Default: `"true"`   
`GF_DASHBOARDS_JSON_PATH` - Path where JSON Dashboards are stored. Default: `/opt/grafana`   

### InfluxDB  
`INFLUX_DATABASE` - IndluxDB Database Name. Default:  `"telegraf"`   
`INLFUX_ADMIN_USER` - IndluxDB Admin Username. Default: `"grafana"`  
`INFLUX_ADMIN_PASS` - InfluxDB Admin Password. Default: `"grafana"`    

### Telegraf  
`HOST_NAME` - Telegraf Default Hostane. Default: `"telegraf"`  
`INFLUXDB_HOST` - IndluxDB Database Host. Default: `"influxdb"`  
`INFLUXDB_PORT` - InfluxDB Default Port. Default: `"8086"`  
`DATABASE` - InfluxDB Database where telegraf stores data. Default: `"telegraf"`  

## Ports
Grafana: `3000`
InfluxDB: `8083`, `8086`

## License
Copyright © 2016 Mateusz Trojak. See LICENSE for details.

## TODO
* Add more Grafs

## Metadata
* [![Build Status](https://travis-ci.org/matisku/tig-stack.svg?branch=master)](https://travis-ci.org/matisku/tig-stack)  [![CircleCI](https://circleci.com/gh/matisku/tig-stack.svg?style=svg)](https://circleci.com/gh/matisku/tig-stack)
* [matisq/telegraf](https://hub.docker.com/r/matisq/telegraf/) [![](https://images.microbadger.com/badges/image/matisq/telegraf.svg)](http://microbadger.com/images/matisq/telegraf "Get your own image badge on microbadger.com")
* [matisq/influxdb](https://hub.docker.com/r/matisq/influxdb/) [![](https://images.microbadger.com/badges/image/matisq/influxdb.svg)](http://microbadger.com/images/matisq/influxdb "Get your own image badge on microbadger.com")
* [matisq/grafana](https://hub.docker.com/r/matisq/grafana/) [![](https://images.microbadger.com/badges/image/matisq/grafana.svg)](http://microbadger.com/images/matisq/grafana "Get your own image badge on microbadger.com")
