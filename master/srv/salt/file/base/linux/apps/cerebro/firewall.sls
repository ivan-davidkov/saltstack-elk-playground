# tcp filewall rules
cerebro_input_rule:
  iptables.insert:
    - position: 8
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 9000
    - proto: tcp
    - save: True
