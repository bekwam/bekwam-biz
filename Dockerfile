FROM python:3.8

LABEL maintainer="Carl Walker <carl@bekwam.com>"

RUN apt-get update
RUN apt-get -y install nginx 

RUN python -m pip install --upgrade pip

RUN pip install mkdocs

# gather source and compiled output here
WORKDIR /bekwam-biz

# copy "up" source markdown
COPY . .

# put generated html under ngnix
RUN mkdocs build --site-dir=/var/www/html

EXPOSE 80

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
