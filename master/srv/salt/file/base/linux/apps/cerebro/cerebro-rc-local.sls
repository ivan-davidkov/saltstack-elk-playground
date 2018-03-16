/etc/rc.d/rc.local:
  file.append:
    - text:
      - nohub sh /var/www/cerebro/bin/cerebro &

# linux:
#   system:
#     rc:
#       local: |
#         #!/bin/sh -e
#         #
#         # rc.local
#         #
#         # This script is executed at the end of each multiuser runlevel.
#         # Make sure that the script will "exit 0" on success or any other
#         # value on error.
#         #
#         # In order to enable or disable this script just change the execution
#         # bits.
#         #
#         # By default this script does nothing.
#         exit 0
#
#         nohub sh /var/www/cerebro/bin/cerebro &
