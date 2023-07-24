FROM nginx
COPY . /usr/share/nginx/html

COPY index1.html /usr/share/nginx/html/index.html
COPY contact.html /usr/share/nginx/html/contact.html
