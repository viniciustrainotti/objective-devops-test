FROM node:12-alpine

MAINTAINER Vinícius Trainotti <vtrainotti@live.com>

ENV HTTP_PORT=3000

WORKDIR /opt/app-root/src

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
