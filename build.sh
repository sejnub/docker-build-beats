#!/bin/bash

ELASTIC_VERSION="v6.6.0"

echo "#### build.sh has started."

go get github.com/elastic/beats

# INFO: Compare this with 
# - https://github.com/andig/beats4pi/blob/master/build.sh
# - https://gist.github.com/andig/650915e02b18cfe38de6516686977bca
#   - This includes the generating of the templates

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
