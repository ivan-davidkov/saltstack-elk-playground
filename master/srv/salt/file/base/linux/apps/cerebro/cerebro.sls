cerebro-server:
  archive.extracted:
    - name: /var/www/cerebro
    - source: salt://linux/apps/cerebro/files/cerebro-0.7.2.tar.gz
    - source_hash: md5=42f40b2fdaee8ad34713ba3a83f1a810
    - options: v
    - user: nginx
    - group: nginx
    - archive_format: tar
    - if_missing: /var/www/cerebro


cerebro-config:
  file.recurse:
    - name: /usr/share/cerebro/conf
    - source: salt://linux/apps/cerebro/config
    - user: kibana
    - group: kibana
    - file_mode: 644
    - dir_mode: 774
