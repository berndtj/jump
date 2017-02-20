#!/bin/bash

cat << EOF > meta-data
local-hostname: localhost
EOF

key=$(cat $HOME/.ssh/id_rsa.pub)

cat << EOF > user-data
#cloud-config
# password: ubuntu
ssh_authorized_keys:
    - $key
EOF

mkisofs -output seed.iso -volid cidata -joliet -rock user-data meta-data