FROM nginx:latest
COPY index.html /user/share/nginx/html
EXPOSE 80