elasticsearch-repository:
  file.managed:
    - name: /etc/yum.repos.d/elasticsearch.repo
    - source: salt://defaults/linux/repositories/files/elasticsearch.repo
