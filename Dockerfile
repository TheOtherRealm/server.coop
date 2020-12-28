ARG  CODE_VERSION=latest
FROM nginx:$CODE_VERSION
ADD . .
# RUN -it --rm --name certbot -v "/etc/letsencrypt:/etc/letsencrypt" -v "/var/lib/letsencrypt:/var/lib/letsencrypt" certbot/certbot certonly
RUN ./setupServer.sh