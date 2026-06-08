#!/bin/sh -e
echo "Obteniendo las ips activas de ANTEL, esto tomara varias horas"
nmap --randomize-hosts -n -sn 167.56.0.0/13>> antel.log &
nmap --randomize-hosts -n -sn 167.108.0.0/16>> antel.log &
nmap --randomize-hosts -n -sn 167.116.0.0/16>> antel.log &
nmap --randomize-hosts -n -sn 179.24.0.0/13>> antel.log &
nmap --randomize-hosts -n -sn 186.48.0.0/14>> antel.log &
nmap --randomize-hosts -n -sn 186.52.0.0/14>> antel.log &
nmap --randomize-hosts -n -sn 190.0.128.0/19>> antel.log &
nmap --randomize-hosts -n -sn 190.64.0.0/16>> antel.log &
nmap --randomize-hosts -n -sn 190.132.0.0/14>> antel.log &
nmap --randomize-hosts -n -sn 200.2.32.0/19>> antel.log &
nmap --randomize-hosts -n -sn 200.40.0.0/16>> antel.log &
nmap --randomize-hosts -n -sn 200.125.0.0/18>> antel.log &
nmap --randomize-hosts -n -sn 201.217.128.0/18>> antel.log &
nmap --randomize-hosts -n -sn 201.221.32.0/19>> antel.log &
echo "Listo, recuerda repetir esto a diario"
