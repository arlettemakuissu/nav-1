FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY ./* /usr/share/nginx/html/
COPY ./images /usr/share/nginx/html/images
