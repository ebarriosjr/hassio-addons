server {
  listen {{ .interface }}:{{ .port }} default_server;
  listen {{ .interface }}:9099 default_server;
  include /etc/nginx/includes/server_params.conf;
  include /etc/nginx/includes/proxy_params.conf;
  client_max_body_size 0;

  location / {
    absolute_redirect off;
    proxy_pass {{ .protocol }}://backend/ui/jobs;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_read_timeout 310s;
    proxy_buffering off;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Origin "${scheme}://${proxy_host}";
  }
}
