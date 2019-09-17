# Stage 0, "build-stage", based on Node.js, to build and compile the frontend
FROM node:latest as build-stage
WORKDIR /app
COPY . .
RUN npm install 
RUN npm run build --prod
FROM nginx:1.15
#Copy ci-dashboard-dist
COPY --from=build-stage /app/dist/spa-demo/ /usr/share/nginx/html
#Copy default nginx configuration
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf