#! /bin/sh

### openssl

VER=3.3.2
CUROPENSSL=openssl-${VER}

cd
ROCHOME=$(pwd)

if [ ! -d rocopenssl ];
then
    mkdir rocopenssl
    mkdir rocopensslsrc
    mkdir rocopenssldir
fi

if [ ! -f ~/${CUROPENSSL}.tar.gz ]; 
then
    wget https://www.openssl.org/source/${CUROPENSSL}.tar.gz
    tar -zxvf ~/${CUROPENSSL}.tar.gz -C ~/rocopensslsrc
	
    cd ~/rocopensslsrc/${CUROPENSSL}
    ./config --prefix=${ROCHOME}/rocopenssl --openssldir=${ROCHOME}/rocopenssldir 
    make
#    make test
    sudo make install
fi


UNAME=$(uname -a)
result=$(echo ${UNAME} | grep "ubuntu")
if [ "$result" != "" ]; then
    sudo mv -f /usr/lib/x86_64-linux-gnu/libcrypto.so.3 /usr/lib/x86_64-linux-gnu/libcrypto.so.3.rocbaknewopenssl
    sudo mv -f /usr/lib/x86_64-linux-gnu/libssl.so.3 /usr/lib/x86_64-linux-gnu/libssl.so.3.rocbaknewopenssl
    sudo ln -sf ${ROCHOME}/rocopenssl/lib64/libcrypto.so.3 /usr/lib/x86_64-linux-gnu/libcrypto.so.3
    sudo ln -sf ${ROCHOME}/rocopenssl/lib64/libssl.so.3 /usr/lib/x86_64-linux-gnu/libssl.so.3
  
    sudo mv -f /usr/bin/openssl /usr/bin/opensslbak
    sudo ln -sf ${ROCHOME}/rocopenssl/bin/openssl /usr/bin/openssl
    
fi
 

UNAME=$(uname -a)
result=$(echo ${UNAME} | grep "WSL")
if [ "$result" != "" ]; then
    sudo mv -f /usr/lib/x86_64-linux-gnu/libcrypto.so.3 /usr/lib/x86_64-linux-gnu/libcrypto.so.3.rocbaknewopenssl
    sudo mv -f /usr/lib/x86_64-linux-gnu/libssl.so.3 /usr/lib/x86_64-linux-gnu/libssl.so.3.rocbaknewopenssl
    sudo ln -sf ${ROCHOME}/rocopenssl/lib64/libcrypto.so.3 /usr/lib/x86_64-linux-gnu/libcrypto.so.3
    sudo ln -sf ${ROCHOME}/rocopenssl/lib64/libssl.so.3 /usr/lib/x86_64-linux-gnu/libssl.so.3
  
    sudo mv -f /usr/bin/openssl /usr/bin/opensslbak
    sudo ln -sf ${ROCHOME}/rocopenssl/bin/openssl /usr/bin/openssl
    
fi
openssl version

rm ~/${CUROPENSSL}.tar.gz

