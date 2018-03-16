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

cf-cerebro.yml:
  file.managed:
    - name: /usr/share/cerebro/conf/application.conf
    - source: salt://linux/apps/cerebro/config/application.conf
