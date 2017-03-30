FROM python:3.6

MAINTAINER Samuel Colvin <s@muelcolvin.com>

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
 && apt-get -qq update
 && apt-get -y install git libjpeg-dev libfreetype6-dev libffi-dev libsqlite3-dev postgresql-client
 && apt-get -y install gettext nodejs unzip libnss3 libgconf-2-4
 && wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/2.10/chromedriver_linux64.zip
 && unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/
