#!/usr/bin/env bash

PROM_DOWNLOAD_LINK=https://github.com/prometheus/prometheus/releases/download/v2.20.1/prometheus-2.20.1.linux-amd64.tar.gz
BASE_PATH=/home/vagrant
CONFIG_FILE="/vagrant/custom.yaml"

if ! [ -s $BASE_PATH/prometheus*/prometheus ]; then
	curl -L $PROM_DOWNLOAD_LINK -o $BASE_PATH/prometheus-2.20.1.linux-amd64.tar.gz
	cd $BASE_PATH
	tar zxvf prometheus-*.tar.gz
fi

cd $BASE_PATH/prometheus*

if [ -z CONFIG_FILE ]; then
	# default yaml
	CONFIG_FILE="prometheus.yml"
fi

echo "Starting prometheus with $CONFIG_FILE"
nohup ./prometheus --config.file=$CONFIG_FILE > prometheus.log 2>&1 &
