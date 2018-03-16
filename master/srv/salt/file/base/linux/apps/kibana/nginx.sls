elk-kibana-nginx-package:
  pkg.installed:
    - pkgs:
      - nginx
    - require:
      - sls: defaults.linux.repositories

nginx-config:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://linux/apps/kibana/nginx-conf/nginx.conf
    - user: nginx
    - group: nginx
    - mode: 640

nginx-ssl:
  file.recurse:
    - name: /etc/nginx/ssl
    - source: salt://linux/apps/kibana/nginx-conf/ssl
    - user: nginx
    - group: nginx
    - file_mode: 640
    - dir_mode: 770
