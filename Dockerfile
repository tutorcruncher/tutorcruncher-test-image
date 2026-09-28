FROM heroku/heroku:26

LABEL maintainer="Tom Hamilton Stubber <tomhamiltonstubber@gmail.com>"

# heroku-24 onwards defaults to the unprivileged heroku user; CircleCI needs root to install and write /tutorcruncher
USER root
WORKDIR /root/
ADD install.sh install.sh
RUN bash install.sh
