FROM node:24-alpine AS build-deps

WORKDIR /usr/src/app
COPY . ./

RUN yarn
RUN yarn build

FROM nginx:1.12-alpine
COPY --from=build-deps /usr/src/app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
