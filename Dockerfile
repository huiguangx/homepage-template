# FROM ccr.ccs.tencentyun.com/rootegg/node:20.12.2-pm2-alpine

# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# RUN apk add --update --no-cache nginx

# RUN npm install -g pnpm

# WORKDIR /app

# COPY ./start.sh ./start.sh

# COPY ./ecosystem.config.js ./ecosystem.config.js

# COPY ./app.js ./app.js

# RUN chmod 777 ./start.sh

# CMD ["sh", "./start.sh"]
