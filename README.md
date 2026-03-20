# Telegraf InfluxDB Grafana Stack
Edits made in this fork (origin project from Mateusz Trojak):
  * Modified `telegraf/telegraf.template.conf` to only contain the relevant
    components for Cisco gRPC telemetry on IOS-XE over TCP 42518.
  * Modified `docker-compose.yml` to build the `telegraf` service locally
    rather than pull down the Docker Hub image. All other services are
    pulled from Docker Hub as they remain unchanged.
  * Deleted these unused files/directories to reduce distraction:
    * `docker-compose-circleci.yml`
    * `docker-compose-noplugins.yml`
    * `circle.yml`
    * `rancher/`
    * `grafana/`
    * `influxdb/`

## What is inside TIG Stack
* [Telegraf](https://hub.docker.com/r/matisq/telegraf/) - Gathers cpu,mem,net,docker data and sends it to InfluxDB
* [InfluxDB](https://hub.docker.com/r/matisq/influxdb/) + volume data - Stores data from Telegraf
* [Grafana](https://hub.docker.com/r/matisq/grafana/) + volume data - Includes one Dashboard (there will be more!) for docker monitoring.

## How to use it?
TIG stack is created for [Rancher](http://rancher.com/). If you are not fammiliar with rancher, please [read](http://rancher.com/rancher/) some docs, because it is really great Docker Orchestration Tool.  
To use it add custom [rancher-catalog](https://github.com/matisku/rancher-catalog) to the Rancher configuration, and within only one click, you are able to monitor your Docker Instance automatically!  

## What if I don't want to use Rancher?
You can obviously use this stack without Rancher. Just grab [docker-compose.yml](https://raw.githubusercontent.com/matisku/tig-stack/master/docker-compose.yml) file and start your stack as usual.
```bash
$ mkdir tig-stack
$ cd tig-stack
$ curl -OL https://raw.githubusercontent.com/matisku/tig-stack/master/docker-compose.yml
$ docker compose up -d --build
```

If needed you can clone this repository and build `tig-stack` locally:
```bash
$ git clone https://github.com/matisku/tig-stack.git
$ cd tig-stack
$ docker compose up -d --build
```

## Additional Info
* By default Grafana will have all available plugins installed.   
* To access grafana go to: `http://localhost:3000`   
* Health checks in `docker-compose.yml` use `wget` inside containers. If your image lacks `wget`, remove or adjust the `healthcheck` blocks.

## CI
This repo uses GitHub Actions to build the local Telegraf image, bring up the stack with Docker Compose, run smoke and InfluxDB integration checks, and run container security scans with an SBOM artifact.

## Local Workflow
Common targets are provided via `make`:
```bash
$ make up
$ make test
$ make logs
$ make down
```
Optional overrides can be placed in a `.env` file. A template is provided in `.env.example`.

## Dependency Updates
Renovate is configured via `renovate.json` to keep Docker image tags and digests up to date. Major updates require explicit approval.

## Branch Protection
For safe merges, configure branch protection in GitHub so that:
1. Pull requests are required for `main`/`master`
2. The `CI` workflow is required and must pass
3. Merge is blocked when checks are failing

## Environment
### Images
`GRAFANA_TAG` - Grafana image tag. Default: `latest`  
`INFLUXDB_TAG` - InfluxDB image tag. Default: `latest`  

### Grafana  
`GF_SECURITY_ADMIN_USER` - Admin Username. Default: `admin`  
`GF_SECURITY_ADMIN_PASSWORD`- Admin User Password. Default:`admin`  
`GF_SECURITY_SECRET_KEY` - Secret key. Default: `grafana`  
`GF_USERS_ALLOW_SIGN_UP` - Allow singup to Grafana. Default: `"true"`  
`GF_USERS_ALLOW_ORG_CREATE` - Allow user create new Orgs. Default: `"true"`  
`GF_AUTH_ANONYMOUS_ENABLED` - Anonymus autthorization enabled. Default: `"true"`  
`GF_AUTH_ANONYMOUS_ORG_NAME` - Anonymus defaul Org Name. Default: `grafana`   
`GF_DASHBOARDS_JSON_ENABLED` - Dashboards as JSON enabled. Default: `"true"`   
`GF_DASHBOARDS_JSON_PATH` - Path where JSON Dashboards are stored. Default: `/opt/grafana`   
`GRAFANA_PLUGINS_ENABLED` - Install all available Grafana Plugins. Default: `true`

### InfluxDB  
`INFLUX_DATABASE` - IndluxDB Database Name. Default:  `"telegraf"`   
`INLFUX_ADMIN_USER` - IndluxDB Admin Username. Default: `"grafana"`  
`INFLUX_ADMIN_PASS` - InfluxDB Admin Password. Default: `"grafana"`    

### Telegraf  
`HOST_NAME` - Telegraf Default Hostane. Default: `"telegraf"`  
`INFLUXDB_HOST` - IndluxDB Database Host. Default: `"influxdb"`  
`INFLUXDB_PORT` - InfluxDB Default Port. Default: `"8086"`  
`DATABASE` - InfluxDB Database where telegraf stores data. Default: `"telegraf"`  

### Ports (Optional Overrides)
`GRAFANA_PORT` - Host port for Grafana. Default: `3000`  
`INFLUXDB_HTTP_PORT` - Host port for InfluxDB HTTP API. Default: `8086`  
`INFLUXDB_ADMIN_PORT` - Host port for InfluxDB admin UI. Default: `8083`  
`TELEGRAF_GRPC_PORT` - Host port for Telegraf gRPC. Default: `42518`  

## Security Notes
The default credentials in `.env.example` are for local testing only. For any shared or production use, override them in `.env` and restrict network exposure.

## Trivy Ignore
If upstream Telegraf releases have not yet incorporated security fixes, this repo temporarily suppresses known CVEs in `.trivyignore`. Remove entries once the base Telegraf image is upgraded to fixed versions.

## Ports
Grafana:   
    - `3000` - in Docker   
   - `3000` - on Host   
InfluxDB:   
    - `8083`   
    - `8086`   

## License
Copyright © 2016-2018 Mateusz Trojak. See LICENSE for details.

## TODO
* Add more Grafs

## Metadata
* [matisq/telegraf](https://hub.docker.com/r/matisq/telegraf/) [![](https://images.microbadger.com/badges/image/matisq/telegraf.svg)](http://microbadger.com/images/matisq/telegraf "Get your own image badge on microbadger.com")
* [matisq/influxdb](https://hub.docker.com/r/matisq/influxdb/) [![](https://images.microbadger.com/badges/image/matisq/influxdb.svg)](http://microbadger.com/images/matisq/influxdb "Get your own image badge on microbadger.com")
* [matisq/grafana](https://hub.docker.com/r/matisq/grafana/) [![](https://images.microbadger.com/badges/image/matisq/grafana.svg)](http://microbadger.com/images/matisq/grafana "Get your own image badge on microbadger.com")
