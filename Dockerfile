FROM node:14-alpine as build
LABEL description="This is a multi-stage NodeJS image"
WORKDIR /src
COPY ["package.json", "./"]
RUN npm install
COPY . .

FROM node:14-alpine
WORKDIR /app 
COPY --from=build /src /app/
EXPOSE 8090
ENTRYPOINT [ "npm", "run" ]
CMD [ "start" ]