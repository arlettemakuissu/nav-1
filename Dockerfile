FROM nginx
COPY . /usr/share/nginx/html/
COPY index1.html /usr/share/nginx/html/html/index.html
