# compile stage
FROM ccr.ccs.tencentyun.com/rootegg/node:pnpm-9.3.0 as build-stage

WORKDIR /appinstall

COPY package*.json pnpm-lock.yaml ./

RUN pnpm install

COPY . .

RUN pnpm run build

# production stage
FROM ccr.ccs.tencentyun.com/rootegg/node:21.7.3-pm2-nginx-alpine as production-stage

WORKDIR /app

COPY --from=build-stage /appinstall/.output/ .

RUN echo -e "module.exports = { \n\
  apps: [{ \n\
    name: 'app', \n\
    exec_mode: 'cluster', \n\
    instances: 'max', \n\
    script: './server/index.mjs' \n\
  }] \n\
}" > ./ecosystem.config.js

RUN echo -e "server {  \n\
    listen       80; \n\
    location /api/ { \n\
        proxy_pass  http://172.16.0.10:8080/api/; \n\
    } \n\
    location / { \n\
        proxy_pass  http://127.0.0.1:3000/; \n\
    } \n\
    gzip on; \n\
    gzip_min_length 1k; \n\
    gzip_http_version 1.1; \n\
    gzip_comp_level 6; \n\
    gzip_types text/plain application/x-javascript text/css application/xml application/javascript; \n\
    gzip_vary on; \n\
    access_log  /var/log/nginx/access.log ; \n\
} " > /etc/nginx/http.d/default.conf
