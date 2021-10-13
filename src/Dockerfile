FROM node:12-alpine

MAINTAINER Vinícius Trainotti <vtrainotti@live.com>

ENV NODE_ENV=production \
    HOME=/opt/app-root/src/

# adduser -D (Don't assign a password) -g '' (GECOS without fullname) odt (objective devops test)
RUN adduser -D -g '' odt
# creante workdir and permissions user odt:odt
RUN mkdir -p ${HOME} && chown -R odt:odt ${HOME}
# Declare odt user
USER odt
# Declare WORKDIR = /opt/app-root/src/
WORKDIR ${HOME}
# Copy to prepare dependencies install
COPY --chown=odt:odt package*.json ${HOME}
# npm install to deployment into production
RUN npm ci --only=production
# Copy application
COPY --chown=odt:odt index.js ${HOME}
# Expose declare port 80
EXPOSE 80
# CMD declared equal default into package.json
CMD ["npm", "start"]
