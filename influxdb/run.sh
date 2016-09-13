#!/bin/bash

set -m
CONFIG_TEMPLATE="/influxdb.template.conf"
CONFIG_FILE="/etc/influxdb/influxdb.conf"

INFLUX_HOST="localhost"
INFLUX_API_PORT="8086"
[ "${INLFUX_ADMIN_USER}" = "" ] &&
        INLFUX_ADMIN_USER="grafana"
[ "${INFLUX_ADMIN_PASS}" = "" ] &&
        INFLUX_ADMIN_PASS="grafana"
[ "${INFLUX_DATABASE}" = "" ] &&
        JENKINS_BIN="telegraf"

mv -v $CONFIG_FILE $CONFIG_FILE".orig"
mv -v $CONFIG_TEMPLATE $CONFIG_FILE

exec influxd -config=$CONFIG_FILE 1>>/var/log/influxdb/influxdb.log 2>&1 &
sleep 5

USER_EXISTS=`influx -host=${INFLUX_HOST} -port=${INFLUX_API_PORT} -execute="SHOW USERS" | awk '{print $1}' | grep "${INLFUX_ADMIN_USER}" | wc -l`

if [ -n ${USER_EXISTS} ]
then
  influx -host=${INFLUX_HOST} -port=${INFLUX_API_PORT} -execute="CREATE USER ${INLFUX_ADMIN_USER} WITH PASSWORD '${INFLUX_ADMIN_PASS}' WITH ALL PRIVILEGES"
  influx -host=${INFLUX_HOST} -port=${INFLUX_API_PORT} -username=${INLFUX_ADMIN_USER} -password="${INFLUX_ADMIN_PASS}" -execute="create database ${INFLUX_DATABASE}"
  influx -host=${INFLUX_HOST} -port=${INFLUX_API_PORT} -username=${INLFUX_ADMIN_USER} -password="${INFLUX_ADMIN_PASS}" -execute="grant all PRIVILEGES on ${INFLUX_DATABASE} to ${INLFUX_ADMIN_USER}"
fi 

tail -f /var/log/influxdb/influxdb.log

