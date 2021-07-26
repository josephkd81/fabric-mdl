#!/bin/bash
export CORE_PEER_LOCALMSPID="Org1MSP"
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/organizations/ordererOrganizations/example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export CORE_PEER_TLS_ROOTCERT_FILES=/opt/gopath/src/github.com/hyperledger/fabric/peer/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_TLS_ROOTCERT_FILES2=/opt/gopath/src/github.com/hyperledger/fabric/peer/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
#export ORG2_TLS_ROOT_CERT_FILES=/opt/gopath/src/github.com/hyperledger/fabric/peer/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051
export CORE_PEER_ADDRESS2=peer0.org2.example.com:9051
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp


#peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile $ORDERER_CA -C mychannel -n mdm --peerAddresses localhost:7051 --tlsRootCertFiles $ORG1_TLS_ROOT_CERT_FILES --peerAddresses localhost:9051 --tlsRootCertFiles $ORG2_TLS_ROOT_CERT_FILES -c '{"function":"DeployNewContract", "Args":["d24dff6117936b6ff97108cf26c1dd8865743d87","10000000","00b54e93ee2eba3086a55f4249873e291d1ab06c","26eaa549b9fb12fadfee4a9c34452fa6db62b85e","0","MDM"]}'

#peer chaincode invoke -o orderer.example.com:7050 --tls --cafile $ORDERER_CA -C mychannel -n mdm -c '{"function":"DeployNewContract", "Args":["d24dff6117936b6ff97108cf26c1dd8865743d87","10000000","00b54e93ee2eba3086a55f4249873e291d1ab06c","26eaa549b9fb12fadfee4a9c34452fa6db62b85e","0","MDM"]}'


#peer chaincode invoke -o orderer.example.com:7050 --tls --cafile $ORDERER_CA -C mychannel -n mdm -c '{"function":"DeployNewContract","Args":["10000000","00b54e93ee2eba3086a55f4249873e291d1ab06c","26eaa549b9fb12fadfee4a9c34452fa6db62b85e","0","MDM"]}'

peer chaincode invoke -o orderer.example.com:7050 --peerAddresses $CORE_PEER_ADDRESS --peerAddresses $CORE_PEER_ADDRESS2 --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILES --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILES2 --tls --cafile $ORDERER_CA -C mychannel -n mdm -c '{"function":"SendTransactions","Args":["f8a58081c882520894d24dff6117936b6ff97108cf26c1dd8865743d8780b844a9059cbb000000000000000000000000960fa583ff456c6ee6b0c61a774bc8776a22f1cc000000000000000000000000000000000000000000000000000000000000271047a0ff69b8aeb667bc60b959e68a6d16571f3554c6aa1da365888b8601d6476f8f13a024cf5e9a9ad3dcb2ef580a0598aa1904a8cd8d88429a14e84a1e5d45850727e4","f8a50181c882520894d24dff6117936b6ff97108cf26c1dd8865743d8780b844a9059cbb000000000000000000000000960fa583ff456c6ee6b0c61a774bc8776a22f1cc000000000000000000000000000000000000000000000000000000000000271047a083364daec5f4fb493d9ec37070a258e97c3cfca1ed215351ec29754dd7006c6ba024f5bd529876993f4fc36918947213413ddadec5d2f01f977e316ed00e2e6e03","f8a50281c882520894d24dff6117936b6ff97108cf26c1dd8865743d8780b844a9059cbb000000000000000000000000960fa583ff456c6ee6b0c61a774bc8776a22f1cc000000000000000000000000000000000000000000000000000000000000271048a012b8b72e6671c38ec9ba73dfe5b3be12ddd981ad38f55ff18e9b1835a2fa1de3a04f80476af2b4ae609452635646e14d62b4eeef92fc640b5a483e948836b0ae6e"]}'
