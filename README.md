# Collector

 A flume collector auto-loading plugins at startup.

* All the `*.tar.gz` in `/plugins` will be extracted and loaded as flume plugins.
* Flume will pick of the conf in `/collector.conf`

 Example docker-compose:

 ```yml
 image: euranova/flume-collector-with-plugins:1.7.0
 environment:
   FLUME_AGENT: my-flume-collector
 ports:
 - localhost:44444:44444
 volumes:
 - ./data/source:/data-source
 - ./data/output:/data-output
 - ./collector/my-flume-collector.conf:/collector.conf
 - ./collector/my-flume-collector-lib-0.0.1-flume-plugin.tar.gz:/plugins/my-flume-collector-lib-0.0.1-flume-plugin.tar.gz
 ```
