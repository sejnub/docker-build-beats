#!/bin/bash

ELASTIC_VERSION="v6.6.0"

echo "#### build.sh has started."

go get github.com/elastic/beats

echo
echo "#######################"
echo "INFO: building filebeat"
cd /go/src/github.com/elastic/beats/filebeat/
git checkout $ELASTIC_VERSION
GOARCH=arm go build
chmod ugo+xw filebeat
cp filebeat /build


echo
echo "#########################"
echo "INFO: building metricbeat"
cd /go/src/github.com/elastic/beats/metricbeat/
git checkout $ELASTIC_VERSION
GOARCH=arm go build
chmod ugo+xw metricbeat
cp metricbeat /build

echo
echo "########################"
echo "INFO: building heartbeat"
cd /go/src/github.com/elastic/beats/heartbeat/
git checkout $ELASTIC_VERSION
GOARCH=arm go build
chmod ugo+xw heartbeat
cp heartbeat /build


echo
echo "#### build.sh has ended."
