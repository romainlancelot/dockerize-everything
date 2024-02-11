FROM node:20.11.0-alpine3.19

WORKDIR /app
COPY . .

RUN npm install && \
    npm run build

CMD node build
