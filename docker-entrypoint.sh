#!/bin/ash
# Copyright 2021 EZ VPN Inc.
# Author: paolo.denti@gmail.com (Paolo Denti)
#
# SPDX-License-Identifier: AGPL-3.0-only

set -e

cat >/mosquitto/config/mosquitto.conf <<EOF
pid_file /tmp/mosquitto.pid
user mosquitto
per_listener_settings false
EOF

if [ "true" == "${PERSISTENCE}" ]; then
    cat >>/mosquitto/config/mosquitto.conf <<EOF
persistence true
persistence_file mosquitto.db
persistence_location /mosquitto/data
max_queued_messages ${MAX_QUEUED_MESSAGES:-1000}
queue_qos0_messages true
upgrade_outgoing_qos true
autosave_interval ${AUTOSAVE_INTERVAL:-300}
EOF
else
    cat >>/mosquitto/config/mosquitto.conf <<EOF
persistence false
EOF
fi

if [ "true" == "${MQTT_LOG_FILE}" ]; then
    cat >>/mosquitto/config/mosquitto.conf <<EOF
log_dest file /mosquitto/log/mosquitto.log
EOF
fi

if [ "true" == "${MQTT_LOG_STDOUT}" ]; then
    cat >>/mosquitto/config/mosquitto.conf <<EOF
log_dest stdout
EOF
fi

cat >>/mosquitto/config/mosquitto.conf <<EOF
listener ${MQTT_PORT:-1883}
EOF

if ( [ -z "${AUTH_USERNAME}" ] || [ -z "${AUTH_PASSWORD}" ] ); then
    cat >>/mosquitto/config/mosquitto.conf <<EOF
allow_anonymous true
EOF
else
    cat >>/mosquitto/config/mosquitto.conf <<EOF
allow_anonymous false
password_file /tmp/password
EOF

touch /tmp/password
mosquitto_passwd -b /tmp/password "${AUTH_USERNAME}" "${AUTH_PASSWORD}"
fi

chmod 644 /mosquitto/config/mosquitto.conf
chown mosquitto:mosquitto /mosquitto/config/mosquitto.conf

# original content

# Set permissions
user="$(id -u)"
if [ "$user" = '0' ]; then
        [ -d "/mosquitto" ] && chown -R mosquitto:mosquitto /mosquitto || true
fi

exec "$@"