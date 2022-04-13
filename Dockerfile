FROM nginx

RUN mkdir -p ./var/www/defort_flask.com
RUN mkdir -p ./etc/nginx/sites-enable
COPY ./nginx/sites-available/defort_flask.com ./etc/nginx/sites-available/defort_flask.com
COPY ./nginx/hosts/hosts ./etc/hosts
COPY ./nginx/sites-available/defort_flask.com ./etc/nginx/sites-enable/defort_flask.com
RUN #ln -s ./etc/nginx/sites-available/defort_flask.com ./etc/nginx/sites-enable/defort_flask.com

RUN rm ./etc/nginx/conf.d/default.conf
COPY ./nginx/nginx_conf/nginx.conf ./etc/nginx/nginx.conf

COPY ./html/*.html /etc/nginx/html/
COPY ./html/*.css /etc/nginx/html/
COPY ./html/*.png /etc/nginx/html/
COPY ./html/*.js /etc/nginx/html/