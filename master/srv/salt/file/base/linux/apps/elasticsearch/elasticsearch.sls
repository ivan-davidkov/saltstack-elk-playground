elk-elasticsearch-package:
  pkg.installed:
    - pkgs:
      - elasticsearch
      - java-1.8.0-openjdk
      - java-1.8.0-openjdk-devel
      - net-tools-2.0-0.22.20131004git.el7.x86_64
    - require:
      - sls: defaults.linux.repositories

# logstash configuration files here after
elasticsearch-config:
  file.recurse:
    - name: /usr/share/elasticsearch/config
    - source: salt://linux/apps/elasticsearch/config
    - user: elasticsearch
    - group: elasticsearch
    - file_mode: 644
    - dir_mode: 774
