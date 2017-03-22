FROM node:6.10-alpine


# Working enviroment
ENV APPDIR /var/app/cnpmjs.org
ENV CNPMJS_ORG_VERSION 2.19.3
ENV ADDITION_NPM_PACKAGE oss-cnpm

RUN   apk update && \
  apk add ca-certificates wget && \
  update-ca-certificates

RUN \
  mkdir /var/app && \
  install -o node -d /var/app && \
  mkdir /var/www && chown node:node -R /var/www

USER node

RUN \
   wget https://github.com/cnpm/cnpmjs.org/archive/${CNPMJS_ORG_VERSION}.tar.gz && \
  tar xvzf ${CNPMJS_ORG_VERSION}.tar.gz -C /var/app && \
  rm -f ${CNPMJS_ORG_VERSION}.tar.gz && \
  mv /var/app/cnpmjs.org-${CNPMJS_ORG_VERSION} ${APPDIR}

WORKDIR ${APPDIR}

RUN npm install && \
  npm install ${ADDITION_NPM_PACKAGE}

EXPOSE 7001 7002

# Entrypoint
CMD ["/usr/local/bin/node", "/var/app/cnpmjs.org/dispatch.js"]
