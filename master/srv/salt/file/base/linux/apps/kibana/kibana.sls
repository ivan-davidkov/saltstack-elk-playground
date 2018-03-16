elk-kibana-package:
  pkg.installed:
    - pkgs:
      - kibana
    - require:
      - sls: defaults.linux.repositories

# kibana configuration files here after
kibana-config:
  file.recurse:
    - name: /usr/share/kibana/config
    - source: salt://linux/apps/kibana/config
    - user: kibana
    - group: kibana
    - file_mode: 644
    - dir_mode: 774
