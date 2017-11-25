FROM jaehue/golang-onbuild
MAINTAINER jang.jaehue@eland.co.kr

# install go packages
RUN go get github.com/relax-space/lemon-wxpay-api && \
    go get github.com/relax-space/go-kit/...


# add application
ADD . /go/src/lemon-green-wechat
WORKDIR /go/src/lemon-green-wechat
RUN tar xf tmp/wxcert.tar.gz
RUN go install

EXPOSE 5000

CMD ["green-wechat"]