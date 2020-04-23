FROM ubuntu:18.04

# Install build tools
RUN apt-get update && \
    apt-get install build-essential libpcre3 libpcre3-dev libssl-dev ffmpeg unzip wget curl -y

# Get source for nginx, nginx-rtmp-module, and zlib
RUN wget http://nginx.org/download/nginx-1.15.1.tar.gz && \
    wget https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/dev.zip && \
    wget https://www.zlib.net/zlib-1.2.11.tar.gz

# Prepare
RUN tar -zxvf nginx-1.15.1.tar.gz && \
    tar -zxvf zlib-1.2.11.tar.gz && \
    unzip dev.zip

# Build nginx and install it
RUN cd nginx-1.15.1 && \
    ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-dev --with-zlib=../zlib-1.2.11 && \
    make && \
    make install

# Install stunnel4
RUN apt-get install stunnel4 -y

WORKDIR /app

# Move configuration files over
COPY ./nginx.conf /usr/local/nginx/conf/nginx.conf
COPY ./stunnel.conf /etc/stunnel/stunnel.conf
COPY ./start.sh /

EXPOSE 1935

CMD ["start.sh"]
