#!/usr/bin/env bash

apt-get update
apt-get install -y net-tools wget

wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_7.0-1+ubuntu22.04_all.deb
dpkg -i zabbix-release_7.0-1+ubuntu22.04_all.deb
apt-get update

apt-get install -y zabbix-agent2 zabbix-agent2-plugin-*

systemctl enable zabbix-agent2
systemctl restart zabbix-agent2
