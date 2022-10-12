FROM node:12.15.0-slim AS stage1
RUN apt-get update && apt-get install -y wget curl

ARG PORT=8080
ENV PORT=$PORT
ARG CORSANYWHERE_WHITELIST=https://now.urnowhere.com,https://3d.now.urnowhere.com,https://meta3d.dev.urnowhere.com,https://metamorphosis3d.qa.urnowhere.com
ENV CORSANYWHERE_WHITELIST=$CORSANYWHERE_WHITELIST

RUN npm install
RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app/

COPY . .

FROM node:12.15.0-alpine3.11

RUN apk add bash
COPY --from=stage1 /usr/src/app/ /usr/src/app/

WORKDIR /usr/src/app/

EXPOSE 8080

CMD ["node", "server.js"]

USER node
