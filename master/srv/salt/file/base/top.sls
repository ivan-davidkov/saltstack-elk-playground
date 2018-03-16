base:
  '*':
    - defaults.linux

  'kibana':
    - linux.apps.elk-kibana
  'logstash':
    - linux.apps.elk-logstash
  'elasticsearch':
    - linux.apps.elk-elasticsearch
  'cerebro':
    - linux.apps.elk-cerebro

# needed
## certs (files *crt + *key)
## DNS records
## (kibana.tst.srb.europa.eu)
## (elasticsearch.tst.srb.europa.eu)
## (logstash.tst.srb.europa.eu)
## (cerebro.tst.srb.europa.eu)

  # 'G@role:elk':
  #   - default.elk
  #
  # '(kibana|logstash|elastic|cerebro)':
  #   - defaults.elk-kibana
  #   - defaults.elk-logstash
  #   - defaults.elk-elastic
  #   - defaults.elk-cerebro
