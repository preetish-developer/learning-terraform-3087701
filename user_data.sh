#!/bin/sh
sudo su
yum -y install nodejs npm
sleep 10

npm init -y
sleep 5

tee -a index.js > /dev/null <<END
const https = require("https");
const fs = require("fs");
const os = require("os");

const options = {
    cert: fs.readFileSync("/nlb2.cer"),
    key: fs.readFileSync("/nlb2.key")
  
};

https.createServer(options, (req, res) => {
  res.writeHead(200);
  res.end("connected from: "+os.hostname());
}).listen(9350);
END
sleep 5

tee -a nlb2.cer > /dev/null <<END
-----BEGIN CERTIFICATE-----
MIIFnzCCA4egAwIBAgIJAOTkheJH4kIgMA0GCSqGSIb3DQEBCwUAMG4xCzAJBgNV
BAYTAkdCMQswCQYDVQQIDAJORTERMA8GA1UEBwwIR09TRk9SVEgxDDAKBgNVBAoM
A0RXUDEMMAoGA1UECwwDQ01HMSMwIQYDVQQDDBppbnRlcm1lZGlhdGUgZm9yIEVM
SyBzdGFjazAeFw0yMzAyMjAyMjU3MzBaFw0yNjAyMTkyMjU3MzBaMF0xCzAJBgNV
BAYTAkdCMQswCQYDVQQIDAJORTEMMAoGA1UEBwwDR09TMQwwCgYDVQQKDANQUEsx
DDAKBgNVBAsMA1BQSzEXMBUGA1UEAwwOY2VydCBmb3IgbmxiIDIwggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQDHMbFp1Z0ESYkzYQ0Si7v/4M24QYF9B+8K
4j4cCICsCSC3UvlBWDU967UGo/uEBnUwbsXNyzM7y33kB9eEuDohyb1t/IJ7Rkw+
mRTwtsMqkwMukIQKuwP3Kpgl4UyCGt2DaRFmiQLOxpIoU3syOzqLsUqdCLrpELHW
qJriBkdUYYuU7Qxe72b1vZ51hI75RsCEbBHiYdRMGaeb2GohSZXuscgczljz92V/
Zncu/Bx/NquyXEykLiu9aJycQkFy+sWcl+skJTMUacJ3vlTQZV1LhDVpGdk9piQf
jBS4QWnyBDcevZaeEDEVXY6dMV7yE9IMFxypRDGISL+nGebvzpVhAgMBAAGjggFP
MIIBSzAJBgNVHRMEAjAAMCIGCWCGSAGG+EIBDQQVFhNjZXJ0aWZpY2F0ZSBmb3Ig
bmxzMB0GA1UdDgQWBBTRbtAgPTkTPZz8DngMA6eu2+2PGzCBnAYDVR0jBIGUMIGR
gBROfX5T56DCjueC6uRB5Di5nc6ybqFupGwwajELMAkGA1UEBhMCR0IxCzAJBgNV
BAgMAk5FMREwDwYDVQQHDAhHT1NGT1JUSDEMMAoGA1UECgwDRFdQMQwwCgYDVQQL
DANDTUcxHzAdBgNVBAMMFmF3c2NtZy1kZXYuZHdwY2xvdWQudWuCCQDAehPtNQk/
dzAOBgNVHQ8BAf8EBAMCBaAwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMC
MC0GA1UdEQQmMCSCImxvZ3N0YXNoLWRpcmVjdC1hcGkuYXdzLWNtZ2Rldi5jb20w
DQYJKoZIhvcNAQELBQADggIBABe7Aqpc3MVkGOfU9tUVALe3rvvcyyXKSNHvefbL
SUCToLvV2Q/rRwBpb2qO52UaM+OzOKuzUD6dtA/FhFZGGVGGgwCrsbZDc/px5iq7
ZieAwPLWVhmvZiUSKV8iwL9IHgqa+RFmMUry/EM8M3ltykY1Y7OuljXdqnzYq12W
7qC44PDEugmO0KnrjY6b/ms72WJfsiIaN3zNwhi/5MYXf4VNLub/jTeTyx4462E4
VH9tSNOiq7FSEXzoyjHEjvmji8hu0MmBfilPdkyr06I7bAxh87HuwfZogi7wvuEs
+j2QEOVa1Tj7ofhV/N+67rhcL/OBh3SRLFcWHA4zCiIiU1NKjeL61cA0rP+Adizm
6OXUpGIBcry8TeEjnj/K2ilDe3Nzaj2FQikCtiOq9E2IEgpyFEpXk20Q+R0bj+5D
bxq5H4EwwSVwsGWJ34SoRgO1ygVIRSW/vOCnJnb/mlqqmKd1ki5gU79xJDdY/vD+
jcdTEefXgxPiffEJD2xl4Nk1BELsUO24p53Yf58XAGEF4xPDjjT1JskyWiwXSxrF
VMMk3HbnVZO8kUeeEakRQNfMB9SyiNTr79MPRj0J00gK6D5sC0vPOLx3WA6Vn54f
NVXDuOINghceZKkoR5cXy+w9XvrbIl6PTN6ZZQrBK5aGSYvSwPQfU1Lg3Z6fBNXY
oglS
-----END CERTIFICATE-----
END

tee -a nlb2.key > /dev/null <<END
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDHMbFp1Z0ESYkz
YQ0Si7v/4M24QYF9B+8K4j4cCICsCSC3UvlBWDU967UGo/uEBnUwbsXNyzM7y33k
B9eEuDohyb1t/IJ7Rkw+mRTwtsMqkwMukIQKuwP3Kpgl4UyCGt2DaRFmiQLOxpIo
U3syOzqLsUqdCLrpELHWqJriBkdUYYuU7Qxe72b1vZ51hI75RsCEbBHiYdRMGaeb
2GohSZXuscgczljz92V/Zncu/Bx/NquyXEykLiu9aJycQkFy+sWcl+skJTMUacJ3
vlTQZV1LhDVpGdk9piQfjBS4QWnyBDcevZaeEDEVXY6dMV7yE9IMFxypRDGISL+n
GebvzpVhAgMBAAECggEABhv2DwLoL+t5c8P0PK9gcraYWKBZslX99N1/fiicmaom
ALlgv6pO57lE8hExc5knGvcqxecHiTvyfn3nFED6N3MShj8KWXGMgRb8120jizi7
DkCMbC/ULU53ICJK0Gq2hINCb1ygY2sfrHDzBFVgtEwZt7s+0EscyTKenXQH2ASg
AOHt0x7I7Jxsh3cznAYHAN93oMncCIDGJxA7TwrPAoX3JIEXIVwp1RIn+iJ2jjfW
X0LkWRfFaPPiAYFOq8Ysl1G4DgqAnnUAXT1POJfewyRmDeT4ssiJUYkN/yIbXzrO
MGihQbTFwbt8EqT7NHChdgj0/BibvCydXtG+psUACQKBgQDqP0Up7R/5gV2KuDKo
sg6y0sBRUsd8e/scmqgwt5cQ2zqRm4Gszs8KZPNYKoQTfi5awCoXwNFAjHjIGhS8
xK0iJkAPmQpY42wYyK6hfroXanTv/+wlLP28/LP9/lHy6fEmMJdZu1/KZvwMDydk
PoTKn7fY5poF2KZtKfRhPf6pgwKBgQDZsRx1ivNWmy09yI/qc9ei2VkoM7ZCHXQM
K+73h/6tJzXKcPej78FLaGW97f80/CSEAZLMMpFUC9Y8QpVsmU7dmrrFaaot38gQ
0Tx5QPkL7WS08ZTKxFZeNifgs0yhZo4sSTyyRYTpSp/xWChPmVfEFz2CzGVqgPl/
I1dC5AmkSwKBgDk0zGpJy6Y+Tp7jDxQdr/NB/s+dfLRM/u1kY7DKFS17rJkEti2C
sBNkxf0BHRI5nY5yIZV9dFzkMVcE742OJo4Rc1Gb2WgN2kdPMz6jWUUAraAzCvOl
Qi5WNIrSAidltIvUEBJM7T7b2bAEP2V+0yU8zkQ9RN4qo7JDLbhV0IyLAoGBAMCY
v7MG0i9nbulgjmNBRiCf5w94YOGxqUAzhmKdgSa0sBSBSbdSoVMT9B/LdqTsB2p6
8eOTQZx4NHxv9D92i53oDSInUBbyC9FFLRmh8DUrPJQRwDB88GS9yR41w7BwSYzI
5thaRTMZgNRHyLJT2qB0Z0lXiMpnfVWMcOGPWzBtAoGAcRMcJPPdX9SA1jPbD2r2
8NT4m8OpH9AkY0EHBjZdJG4InljG4Xc97qffnjGrLsL2DKWYzmn0xCzZ+g8+F+2B
2IXytGmSXIVJbeG3SHZQCzWRBS+ezkYNuVLhVH1HDZZwFz9GAoUjwCDG9eBGfIt9
IOn4QZtMDSUgR8draATegm0=
-----END PRIVATE KEY-----
END

nohup node index.js > /dev/null &

# To be used for formatting new disk: sudo fdisk -l
# sudo mkfs -t ext4 /dev/xvdf

exit