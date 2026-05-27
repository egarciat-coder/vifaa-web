# Usamos Nginx, un servidor web gratuito y ligero
FROM nginx:alpine

# Copiamos tu página al lugar donde Nginx la busca
COPY index.html /usr/share/nginx/html/index.html

# Script de inicio: usa el puerto dinámico que Railway asigna ($PORT)
# Si no hay $PORT definido, usa 80 como fallback (útil en local)
CMD sh -c "sed -i 's/listen 80/listen ${PORT:-80}/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
