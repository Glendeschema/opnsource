FROM ubuntu

RUN apt-get -y update && apt-get install -y nginx 


RUN rm /var/www/html/index.nginx-debian.html
RUN echo "Hello" $(hostname -f ) >> /var/www/html/index.html
RUN service nginx start
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

EXPOSE 80

