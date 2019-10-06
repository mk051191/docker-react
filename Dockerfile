FROM node:alpine as builder_m
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder_m /app/build /usr/share/nginx/html
