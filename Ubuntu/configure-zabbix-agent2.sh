#!/usr/bin/env bash

UNIQUE_HOSTNAME="debian-$(uuidgen)"
SHORT_HOSTNAME=$(echo "$UNIQUE_HOSTNAME" | cut -d'-' -f1,2)
echo "Nastavuji hostname na: $SHORT_HOSTNAME"

ZABBIX_CONF="/etc/zabbix/zabbix_agent2.conf"
sudo cp -v "$ZABBIX_CONF" "${ZABBIX_CONF}-orig"

sudo sed -i "s/^Hostname=.*/Hostname=$SHORT_HOSTNAME/" "$ZABBIX_CONF"
sudo sed -i 's/^Server=.*/Server=enceladus.pfsense.cz/' "$ZABBIX_CONF"
sudo sed -i 's/^ServerActive=.*/ServerActive=enceladus.pfsense.cz/' "$ZABBIX_CONF"
sudo sed -i 's/^# Timeout=.*/Timeout=30/' "$ZABBIX_CONF"
sudo sed -i 's/^# HostMetadata=.*/HostMetadata=SPOS/' "$ZABBIX_CONF"

sudo diff -u "${ZABBIX_CONF}-orig" "$ZABBIX_CONF"
sudo systemctl restart zabbix-agent2
