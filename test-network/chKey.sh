#!/bin/bash

keyPath=/home/ubuntu/fabric-mdl/test-network/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore

cp $keyPath/$(ls $keyPath) $keyPath/server.key
echo $keyPath/server.key was copied!!!
