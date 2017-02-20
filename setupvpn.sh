#! /bin/bash

cd /etc/openvpn
openssl genrsa -out keys/ca-key.pem 2048
openssl req -x509 -new -nodes -key keys/ca-key.pem -days 3650 -out ca.pem -subj "/CN=openvpn-ca"
openssl genrsa -out keys/server-key.pem 2048
openssl req -new -key keys/server-key.pem -out server.csr -subj "/CN=server"
openssl x509 -req -in server.csr -CA ca.pem -CAkey keys/ca-key.pem -CAcreateserial -out server.pem -days 3650
openssl dhparam -out keys/dh2048.pem 2048