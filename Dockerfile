FROM node:17-alpine3.14 AS builder
WORKDIR /usr/src/app
COPY . ./
RUN yarn
CMD yarn build 

FROM nginx:1.21.5-alpine
RUN mkdir -p /app
WORKDIR /app
COPY --from=builder ./usr/src/app/build ./
COPY nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT [ "nginx", "-g","daemon off;" ]


