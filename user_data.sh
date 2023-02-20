#!/bin/sh
sudo su
yum -y install nodejs npm
sleep 10

npm init -y
sleep 5

tee -a index.js > /dev/null <<END
var http = require('http');
const os = require("os");

http.createServer(function (req, res) {
  res.write("connected from: "+os.hostname());
  res.end();
}).listen(9350);
END
sleep 5

nohup node index.js > /dev/null &

# To be used for formatting new disk: sudo fdisk -l
# sudo mkfs -t ext4 /dev/xvdf

exit