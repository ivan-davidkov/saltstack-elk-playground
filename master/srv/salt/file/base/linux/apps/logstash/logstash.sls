elk-logstash-package:
  pkg.installed:
    - pkgs:
      - logstash
      - java-1.8.0-openjdk
      - java-1.8.0-openjdk-devel
      - net-tools-2.0-0.22.20131004git.el7.x86_64
    - require:
      - sls: defaults.linux.repositories

# logstash configuration files here after
logstash-config:
  file.recurse:
    - name: /usr/share/logstash/config
    - source: salt://linux/apps/logstash/config
    - user: logstash
    - group: logstash
    - file_mode: 644
    - dir_mode: 774

# logstash pipleline files here after
logstash-pipeline:
  file.recurse:
    - name: /usr/share/logstash/pipeline
    - source: salt://linux/apps/logstash/pipeline
    - user: logstash
    - group: logstash
    - file_mode: 644
    - dir_mode: 774
