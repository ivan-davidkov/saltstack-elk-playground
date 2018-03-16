elk-elasticsearch-package:
  pkg.installed:
    - pkgs:
      - elasticsearch
    - require:
      - sls: defaults.linux.repositories

# logstash configuration files here after
elasticsearch-config:
  file.recurse:
    - name: /usr/share/elasticsearch/config
    - source: salt://linux/apps/elasticsearch/config
    - user: kibana
    - group: kibana
    - file_mode: 644
    - dir_mode: 774
