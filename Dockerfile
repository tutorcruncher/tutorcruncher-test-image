FROM heroku/heroku:18

LABEL maintainer="Samuel Colvin <s@muelcolvin.com>"

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
 && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && DEBIAN_FRONTEND=noninteractive apt-get -qq update \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install python3.7 python3.7-dev python3-pip git \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install gettext nodejs yarn \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install -f \
 && ln -s /usr/bin/pip3 /usr/bin/pip
