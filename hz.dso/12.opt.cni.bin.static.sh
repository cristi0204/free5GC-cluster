export PATH=$PATH:/usr/local/go/bin
mkdir -p /opt/cni/bin/

figlet clone plugins
pushd ~/git
    git clone https://github.com/containernetworking/plugins.git containernetworking_plugins
popd

figlet build plugins
pushd ~/git/containernetworking_plugins
    ls -al
    bash ./build_linux.sh
popd

figlet copy static
pushd ~/git/containernetworking_plugins/bin
    cp -r static /opt/cni/bin/
    ls -al /opt/cni/bin/
popd
