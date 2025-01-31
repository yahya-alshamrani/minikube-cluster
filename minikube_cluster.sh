#!/bin/bash

minikube delete

minikube start

minikube addons enable metallb

expect <<EOF
spawn minikube addons configure metallb
expect "Enter Load Balancer Start IP:"
send "192.168.0.222\r"
expect "Enter Load Balancer End IP:"
send "192.168.0.230\r"
expect eof
EOF
