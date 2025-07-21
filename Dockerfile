# base image
FROM node:20 AS base

FROM base AS development
WORKDIR /app
#since i specified work dir the (.) will refer to it
COPY package.json .
RUN npm install
COPY . .

EXPOSE 4000
CMD [ "npm", "run", "dev" ]


FROM base AS production
WORKDIR /app
#since i specified work dir the (.) will refer to it
COPY package.json .
RUN  npm install --only=production
COPY . .

EXPOSE 4000
CMD [ "npm", "start" ]