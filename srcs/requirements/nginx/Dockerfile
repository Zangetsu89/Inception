FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/edawood.pem \
        -keyout /etc/nginx/ssl/edawood.key \
        -subj "/C=NL/ST=North Hollan/L=Amsterdam/O=Codam/OU=edawood/CN=edawood/"

# nginx config
RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
