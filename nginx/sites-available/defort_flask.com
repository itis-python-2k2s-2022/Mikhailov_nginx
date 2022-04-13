server {
        listen 80;
        listen [::]:80;

        server_name defort_flask.com www.defort_flask.com;

        location = /status {
                     access_log off;
                     default_type text/plain;
                     add_header Content-Type text/plain;
                     return 200 "alive";
                }

        location / {
                proxy_pass http://defort_flask:5000;
                proxy_set_header        X-Real-IP       $proxy_add_x_forwarded_for;
                proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header Host $host;
                proxy_redirect off;
            }
}