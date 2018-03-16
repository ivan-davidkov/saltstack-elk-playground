# tcp filewall rules
# based on application schema
# formats: RFC5434, RFC3164
# protocols: SNMP, TCP+TLS, UDP, REPL
# ports (TCP): 161, 162, 6514, 10514
logstash_input_tcp_rule:
  iptables.insert:
    - position: 5
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport:
      - 161
      - 162
      - 6514
      - 10514
    - proto: tcp
    - save: True

# ports (UDP): 161, 514, 601
logstash_input_udp_rule:
  iptables.insert:
    - position: 8
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match: state
    - connstate: NEW
    - dport:
      - 161
      - 514
      - 601
    - proto: udp
    - save: True
