FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

ENV NODE_OPTIONS=--openssl-legacy-provider

RUN npm run build 

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
