FROM node:12.15.0-slim AS stage1
#RUN apt-get update && apt-get install -y wget curl
RUN apt-get install -y wget curl

ARG PORT=8080
ENV PORT=$PORT
ARG CORSANYWHERE_WHITELIST=https://assets.urnowhere.com,https://metamorphosis3d.prod.urnowhere.com,https://metamorphosis3d.now.urnowhere.com,https://nwr-prod-env.appspot.com,https://godel.prod.urnowhere.com,https://nwr.urnowhere.com,https://now.urnowhere.com,https://3d.now.urnowhere.com,https://meta3d.dev.urnowhere.com,https://metamorphosis3d.qa.urnowhere.com,https://pt-br.now.urnowhere.com,http://localhost,http://localhost:8081,https://localhost,https://localhost:8081
ENV CORSANYWHERE_WHITELIST=$CORSANYWHERE_WHITELIST

RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app/

COPY . .

RUN npm install

EXPOSE 8080

CMD ["node", "server.js"]
