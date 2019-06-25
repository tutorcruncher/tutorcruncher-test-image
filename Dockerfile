FROM heroku/heroku:18.v16

LABEL maintainer="Samuel Colvin <s@muelcolvin.com>"

WORKDIR /root/
ADD install.sh install.sh
RUN bash install.sh
