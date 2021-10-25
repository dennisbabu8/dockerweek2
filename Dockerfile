FROM nginx:1.21.3
WORKDIR /app
RUN chown -R nginx:nginx /app && chmod -R 755 /app && \
        chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid
USER nginx
RUN whoami
LABEL "author.name"="dennis"
LABEL "app.running"="test-nginx"
COPY ./index.html /usr/share/nginx/html
EXPOSE 80
