FROM skegio/go:1.6

RUN apt-get update && apt-get install -y  && \
    add-apt-repository ppa:neovim-ppa/unstable && \
    apt-get update && apt-get install -y neovim python-dev python-pip python3-dev python3-pip && \
    pip install neovim && \
    pip3 install neovim

RUN add-apt-repository ppa:jonathonf/vim && \
    apt update && apt install -y vim-nox

RUN GOPATH=/root/go go get -u github.com/golang/lint/golint && \
    GOPATH=/root/go go get -u github.com/kardianos/govendor && \
    GOPATH=/root/go go get github.com/mitchellh/gox && \
    GOPATH=/root/go go get golang.org/x/tools/cmd/goimports && \
    cp -a /root/go/bin/* /usr/bin && \
    rm -rf /root/go
