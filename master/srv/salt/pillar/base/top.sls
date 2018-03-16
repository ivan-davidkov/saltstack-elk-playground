base:
  '*':
    - defaults.common

  '*(cerebro|kibana|logstash|elasticsearch)*':
    - apps.elk
    - roles.elk
