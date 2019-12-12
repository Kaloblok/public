FROM nginx
LABEL maintainer="Yevhenii Herasymchuk"
RUN mkdir /test_task && usermod -a -G root nginx \ 
&& chown -R nginx:root /test_task \
&& chmod -R 777 /test_task
ADD . /test_task
ADD nginx2.conf /etc/nginx/
WORKDIR /test_task
RUN apt update && apt install apache2-utils -y && apt install nano -y && apt-get install nginx-full -y
RUN rm /etc/nginx/nginx.conf && mv /etc/nginx/nginx2.conf /etc/nginx/nginx.conf \
&& mv web/.htpasswd /etc/nginx/.htpasswd \
&& service nginx restart