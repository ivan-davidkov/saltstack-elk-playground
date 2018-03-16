nginx_input_rule:
  iptables.insert:
    - position: 5
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 443
    - proto: tcp
    - save: True

nginx_output_rule:
  iptables.insert:
    - position: 5
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport: 5601
    - proto: tcp
    - save: True
