FROM node:12-alpine

MAINTAINER Vinícius Trainotti <vtrainotti@live.com>

ENV NODE_ENV=production \
    HOME=/opt/app-root/src/

RUN adduser -D -g '' odt

USER odt

WORKDIR ${HOME}

COPY --chown=odt:odt package*.json ${HOME}

RUN npm ci --only=production

COPY --chown=odt:odt index.js ${HOME}

EXPOSE 80

CMD ["npm", "start"]
