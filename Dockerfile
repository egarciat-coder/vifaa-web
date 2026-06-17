FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html
COPY imagenes/ /usr/share/nginx/html/imagenes/
COPY robots.txt /usr/share/nginx/html/robots.txt
COPY sitemap.xml /usr/share/nginx/html/sitemap.xml

RUN mkdir -p /etc/nginx/templates && \
    printf 'server {\n    listen ${PORT};\n    server_name localhost;\n    gzip on;\n    gzip_types text/html text/css application/javascript application/xml image/svg+xml;\n    gzip_min_length 256;\n    location / {\n        root /usr/share/nginx/html;\n        index index.html;\n    }\n}\n' \
    > /etc/nginx/templates/default.conf.template && \
    rm /etc/nginx/conf.d/default.conf

ENV PORT=8080
