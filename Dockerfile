# Usamos Nginx, un servidor web gratuito y ligero
FROM nginx:alpine

# Copiamos tu página al lugar donde Nginx la busca
COPY index.html /usr/share/nginx/html/index.html

# Creamos un template de config: nginx reemplaza ${PORT} automáticamente al arrancar
RUN printf 'server {\n    listen ${PORT};\n    server_name localhost;\n    location / {\n        root /usr/share/nginx/html;\n        index index.html;\n    }\n}\n' \
    > /etc/nginx/templates/default.conf.template

# Eliminamos el config por defecto (usamos solo el template)
RUN rm /etc/nginx/conf.d/default.conf

# Valor por defecto si no hay $PORT (útil para pruebas locales)
ENV PORT=8080
