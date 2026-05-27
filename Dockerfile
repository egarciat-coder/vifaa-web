# Usamos Nginx, un servidor web gratuito y ligero
FROM nginx:alpine

# Copiamos tu página y los assets al lugar donde Nginx la busca
COPY index.html /usr/share/nginx/html/index.html
COPY imagenes/ /usr/share/nginx/html/imagenes/

# Creamos el directorio de templates y el archivo de configuración
RUN mkdir -p /etc/nginx/templates && \
    printf 'server {\n    listen ${PORT};\n    server_name localhost;\n    location / {\n        root /usr/share/nginx/html;\n        index index.html;\n    }\n}\n' \
    > /etc/nginx/templates/default.conf.template && \
    rm /etc/nginx/conf.d/default.conf

# Valor por defecto si no hay $PORT (útil para pruebas locales)
ENV PORT=8080
