FROM skegio/go:1.8

RUN apt-get update && apt-get install -y  && \
    add-apt-repository ppa:neovim-ppa/unstable && \
    apt-get update && apt-get install -y neovim python-dev python-pip python3-dev python3-pip && \
    pip install neovim && \
    pip3 install neovim

RUN add-apt-repository ppa:jonathonf/vim && \
    apt update && apt install -y vim-nox

# the first three are for me, the rest are for vim-go
RUN GOPATH=/root/go go get github.com/golang/lint/golint && \
    GOPATH=/root/go go get github.com/kardianos/govendor && \
    GOPATH=/root/go go get github.com/mitchellh/gox && \
    GOPATH=/root/go go get github.com/nsf/gocode && \
    GOPATH=/root/go go get github.com/alecthomas/gometalinter && \
    GOPATH=/root/go go get golang.org/x/tools/cmd/goimports && \
    GOPATH=/root/go go get golang.org/x/tools/cmd/guru && \
    GOPATH=/root/go go get golang.org/x/tools/cmd/gorename && \
    GOPATH=/root/go go get github.com/golang/lint/golint && \
    GOPATH=/root/go go get github.com/rogpeppe/godef && \
    GOPATH=/root/go go get github.com/kisielk/errcheck && \
    GOPATH=/root/go go get github.com/jstemmer/gotags && \
    GOPATH=/root/go go get github.com/klauspost/asmfmt/cmd/asmfmt && \
    GOPATH=/root/go go get github.com/fatih/motion && \
    GOPATH=/root/go go get github.com/fatih/gomodifytags && \
    GOPATH=/root/go go get github.com/zmb3/gogetdoc && \
    GOPATH=/root/go go get github.com/josharian/impl && \
    cp -a /root/go/bin/* /usr/bin && \
    rm -rf /root/go
