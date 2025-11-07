#!/bin/bash
echo "=== Konfigurace Zabbix Agent2 ==="
sed -i 's/# Server=127.0.0.1/Server=127.0.0.1/' /etc/zabbix/zabbix_agent2.conf
systemctl enable zabbix-agent2
systemctl restart zabbix-agent2
