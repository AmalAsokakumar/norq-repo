#!/bin/bash

# ec2
    # for ubuntu get the local ip and pulblic ip address.

        curl -s http://169.254.169.254/latest/meta-data/local-ipv4
        curl -s http://169.254.169.254/latest/meta-data/public-ipv4
    # for aws linux 

        ifconfig eth0 | grep 'inet ' | awk '{print $2}'



