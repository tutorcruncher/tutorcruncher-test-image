FROM heroku/heroku:22

LABEL maintainer="Tom Hamilton Stubber <tomhamiltonstubber@gmail.com>"

WORKDIR /root/
ADD install.sh install.sh
RUN bash install.sh
