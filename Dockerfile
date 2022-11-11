FROM node:14-alpine as build
LABEL description="This is a multi-stage NodeJS image"
WORKDIR /src
COPY package*.json /src
RUN npm install
COPY . /src

FROM node:14-alpine
WORKDIR /src 
COPY --from=build /src .
EXPOSE 8090
CMD ["node", "index.js"]