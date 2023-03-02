#!/bin/sh
sudo su

# curl -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.17.2-x86_64.rpm
# # sleep 5

# curl -O https://artifacts.elastic.co/downloads/kibana/kibana-7.17.2-x86_64.rpm
# # sleep 5

# rpm --install elasticsearch-7.17.2-x86_64.rpm
# # sleep 5

# rpm --install kibana-7.17.2-x86_64.rpm
# # sleep 5

systemctl start elasticsearch
systemctl start kibana

