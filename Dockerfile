FROM nginx:alpine
LABEL Maintainer="TanNguyen <nguyenngoctan130695@gmail.com>" \
      Description="Sprits Club Website deploy on Nginx Alpine."
COPY . /usr/share/nginx/html

EXPOSE 80