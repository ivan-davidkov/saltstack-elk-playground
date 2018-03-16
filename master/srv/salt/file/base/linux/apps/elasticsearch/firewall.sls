# tcp filewall rules
elasticsearch_input_rule:
  iptables.insert:
    - position: 5
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 9200
    - proto: tcp
    - save: True
