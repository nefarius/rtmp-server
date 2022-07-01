FROM alpine:3

# Build dependencies.
RUN apk add --update \
  build-base \
  ca-certificates \
  curl \
  gcc \
  libc-dev \
  libgcc \
  linux-headers \
  make \
  musl-dev \
  openssl \
  openssl-dev \
  pcre \
  pcre-dev \
  pkgconf \
  pkgconfig \
  zlib-dev \
  git

RUN git clone https://github.com/im-pingo/nginx-client-module.git && \
 git clone https://github.com/im-pingo/nginx-multiport-module.git && \
 git clone https://github.com/im-pingo/nginx-toolkit-module.git && \
 git clone https://github.com/im-pingo/nginx-rtmp-module.git && \
 git clone --depth 1 --branch release-1.18.0 https://github.com/nginx/nginx.git && \
 cd nginx && \
 ./auto/configure --add-module=../nginx-client-module \
   --add-module=../nginx-multiport-module             \
   --add-module=../nginx-toolkit-module               \
   --add-module=../nginx-rtmp-module  && \
 make && make install

ADD nginx.conf /usr/local/nginx/conf/nginx.conf
ADD watch /usr/local/nginx/html/watch
ADD index.html /usr/local/nginx/html/index.html
 
EXPOSE 1935
EXPOSE 80

CMD ["/usr/local/nginx/sbin/nginx"]

