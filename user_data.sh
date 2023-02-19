#!/bin/sh
sudo yum -y install nodejs npm
sudo npm init -y

tee -a index.js > /dev/null <<END
var http = require('http');
const os = require("os");

http.createServer(function (req, res) {
  res.write("connected from: "+os.hostname());
  res.end();
}).listen(9350);
END

sudo nohup node index.js > /dev/null &