### STAGE 1: Définir le répertoire de travail ###
FROM node:14.17.0-alpine as build
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

### STAGE 2: ###
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY --from=build /usr/src/app/dist/DevopsFront/usr/share/nginx/html
EXPOSE 80
