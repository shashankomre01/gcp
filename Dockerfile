# Stage 0, "build-stage", based on Node.js, to build and compile the frontend
FROM alpine:latest
RUN apk update
RUN apk add nginx
WORKDIR /app
COPY dist/gcp /usr/share/nginx/html


