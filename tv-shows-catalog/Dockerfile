FROM node:20.11.0-alpine3.19

ARG BUILD_DIR_PATH

WORKDIR /app
COPY $BUILD_DIR_PATH .

RUN npm install && \
    npm run build