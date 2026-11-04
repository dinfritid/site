FROM nginxinc/nginx-unprivileged:1.29-alpine@sha256:0c79d56aee561a1d81c63f00eee5fb5fe29279560cdc55e91425133104c7fbe6
USER 0
COPY ops/nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html 404.html favicon.svg map-config.json mockServiceWorker.js manrope-LICENSE.txt manrope.ttf /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/
COPY brand/ /usr/share/nginx/html/brand/
COPY clubs/ /usr/share/nginx/html/clubs/
COPY images/ /usr/share/nginx/html/images/
ARG SOURCE_REVISION
RUN printf '{"revision":"%s"}\n' "$SOURCE_REVISION" > /usr/share/nginx/html/_release.json
USER 101
EXPOSE 8080
