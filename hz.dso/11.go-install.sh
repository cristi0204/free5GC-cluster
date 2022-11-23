
mkdir -p ~/tmp/go
pushd ~/tmp/go
    wget https://go.dev/dl/go1.17.linux-amd64.tar.gz
    tar -xvzf go1.17.linux-amd64.tar.gz
    ls
    mv go /usr/local/
    export PATH=$PATH:/usr/local/go/bin
    go version
popd