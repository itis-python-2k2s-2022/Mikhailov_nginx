server {
        listen 80 default_server;
        listen [::]:80 default_server;

        server_name fast_api_host.com www.fast_api_host.com;

        location = /status {
                     access_log off;
                     default_type text/plain;
                     add_header Content-Type text/plain;
                     return 200 "alive fast api";
                }

        location / {
                proxy_pass http://fast_api:5000;
                proxy_set_header        X-Real-IP       $proxy_add_x_forwarded_for;
                proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header Host $host;
                proxy_redirect off;
            }
}