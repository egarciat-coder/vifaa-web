# Usamos Nginx, un servidor web gratuito y ligero
FROM nginx:alpine

# Copiamos tu página al lugar donde Nginx la busca
COPY index.html /usr/share/nginx/html/index.html

# Railway usará el puerto 80 para mostrar la página
EXPOSE 80
