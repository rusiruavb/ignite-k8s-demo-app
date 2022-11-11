FROM node:14-alpine as build
LABEL description="This is a multi-stage NodeJS image"
WORKDIR /src
COPY package*.json .
RUN npm install
COPY . .

FROM node:14-alpine
WORKDIR /src 
COPY --from=build /src .
EXPOSE 8090
CMD ["node", "index.js"]