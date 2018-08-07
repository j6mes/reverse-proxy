FROM nginx
COPY nginx.conf.template /etc/nginx/nginx.conf.template
RUn touch /etc/nginx/ssl.key
RUN touch /etc/nginx/ssl.crt
CMD /bin/bash -c "envsubst '\${TARGET_URL} \${TARGET_PORT} \${LISTEN_PORT} \${LISTEN_PORT_SSL}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && cat /etc/nginx/ssl.key &&exec nginx -g 'daemon off;'"
