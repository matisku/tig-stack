FROM grafana/grafana:latest
MAINTAINER Mateusz Trojak <mateusz.trojak@gmail.com>
LABEL version="1.0"
LABEL description="Grafana Image with added system variables"

RUN apt-get -q update &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q upgrade -y -o Dpkg::Options::="--force-confnew" --no-install-recommends &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew" --no-install-recommends curl &&\
    apt-get -q autoremove &&\
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin

#RUN rm -fv /run.sh
ADD run.sh /run.sh
RUN chmod +x /run.sh
RUN mkdir /opt/grafana
ADD ["*.json", "/opt/grafana/"]
CMD ["/run.sh"]

