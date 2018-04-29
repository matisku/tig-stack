FROM telegraf:latest
MAINTAINER Mateusz Trojak <mateusz.trojak@gmail.com>
LABEL version="1.1"
LABEL description="Telegraf docker image with custom setup"

USER root

ADD telegraf.template.conf /telegraf.template.conf

ADD run.sh /run.sh
RUN chmod +x /*.sh

CMD ["/run.sh"]

