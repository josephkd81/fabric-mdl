# fabric-mdl
fabric-v2.2-for-mdl-explorer-test
---

### Summary
- Test Fabric Network v2.2 for Mdl-explorer

### Test Environment
- AWS EC2 Instance t2.xlarge
- Ubuntu 20.04

### Prerequisite
- golang 1.15.x
```
wget https://dl.google.com/go/go1.15.3.linux-amd64.tar.gz
tar -xvf go1.15.3.linux-amd64.tar.gz
mv go /usr/local
rm go1.15.3.linux-amd64.tar.gz
cp /usr/local/go/bin/go /usr/bin/go
```
- docker 
```
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
sudo arch
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
sudo apt-get update && apt-get install docker-ce docker-ce-cli containerd.io
docker -v
sudo systemctl enable docker && systemctl docker start 
sudo systemctl docker status
```
- docker-compose 1.29.2
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

### Usage
#### Fabric Network Start
Clone this repository :
```
cd /home/ubuntu
git clone https://github.com/josephkd81/fabric-mdl.git
cd ./fabric-mdl/test-network
./network.sh up createChannel -ca
./chKey.sh
```

#### Deploy Chaincode For Test Batch Tx
Clone this repository :
```
cd /home/ubuntu/fabric-mdl/chaincode
git clone https://github.com/the-medium/fabric-token.git
cd ../test-network
./network.sh deployCC -ccn mdm -ccp ../chaincode/fabric-token -ccl go
```

#### Test Invoke
```
docker exec -it cli bash
./scripts/invoke.sh
```
