#!/bin/sh

cd $FLUME_HOME/plugins.d
for f in /plugins/*.tar.gz; do
  tar -xf $f
done

cd $FLUME_HOME

$FLUME_HOME/bin/flume-ng agent \
    -c conf \
    -f /collector.conf \
    --name $FLUME_AGENT \
    -Dflume.root.logger=${ROOT_LOGGER_LEVEL:-INFO},console $@
