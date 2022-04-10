FROM nginx

COPY ./nginx_conf/nginx.conf ./etc/nginx/nginx.conf

COPY ./html/*.html /etc/nginx/html/
COPY ./html/*.css /etc/nginx/html/
COPY ./html/*.png /etc/nginx/html/
COPY ./html/*.js /etc/nginx/html/