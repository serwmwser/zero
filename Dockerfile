FROM ubuntu:22.04

RUN apt update && apt install -y git make golang

RUN git clone --branch polygon https://github.com/maticnetwork/erigon.git && \
    cd erigon && \
    make erigon

COPY zero-genesis.json /erigon/zero-genesis.json

CMD ["/erigon/build/bin/erigon", \
     "--datadir=/data", \
     "--http", \
     "--http.addr=0.0.0.0", \
     "--http.port=8545", \
     "--http.api=eth,net,web3", \
     "--http.corsdomain=*"]
