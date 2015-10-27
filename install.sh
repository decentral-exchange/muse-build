echo -e "machine github.com\n  login ci-user\n  password $CI_USER_PASSWORD" >> ~/.netrc

eval "$(gimme 1.5.1)"

export GOPATH=$HOME/gopath
export PATH=$HOME/gopath/bin:$PATH

go version
go get -u github.com/ipfs/go-ipfs/cmd/ipfs

$GOPATH/bin/ipfs init
$GOPATH/bin/ipfs cat /ipfs/QmVtU7ths96fMgZ8YSZAbKghyieq7AjxNdcqyVzxTt3qVe/readme

npm install -g coffee-script
npm install -g webpack

git clone https://github.com/peertracksinc/muse-ui

cd muse-ui
for I in cli dl web; do cd $I; npm install; cd ..; done;

cd ..
