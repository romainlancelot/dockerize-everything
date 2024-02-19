FROM node:20.11.0-alpine3.19

ENV API_BASE_URL=http://server:3000

WORKDIR /app
COPY . .

RUN npm install && \
    npm run build

CMD node build
