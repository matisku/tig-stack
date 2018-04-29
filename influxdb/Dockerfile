FROM influxdb:latest
MAINTAINER Mateusz Trojak <mateusz.trojak@gmail.com>
LABEL version="1.1"
LABEL description="InfluxDB docker image with custom setup"

USER root

ADD influxdb.template.conf /influxdb.template.conf

ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]

