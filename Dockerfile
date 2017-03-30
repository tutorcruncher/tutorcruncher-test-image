FROM python:3.6

MAINTAINER Samuel Colvin <s@muelcolvin.com>

ADD https://chromedriver.storage.googleapis.com/2.28/chromedriver_linux64.zip /tmp/chromedriver.zip
ADD https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb /tmp/chrome.deb
#ADD chromedriver.zip /tmp/chromedriver.zip
#ADD chrome.deb /tmp/chrome.deb

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
 && apt-get -qq update \
 && apt-get -y install git libjpeg-dev libfreetype6-dev libffi-dev libsqlite3-dev postgresql-client \
 && apt-get -y install gettext nodejs unzip libnss3 libgconf-2-4 xvfb \
 && dpkg -i /tmp/chrome.deb || true \
 && apt-get -y install -f \
 && unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

ENV DISPLAY :99
