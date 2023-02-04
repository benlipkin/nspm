FROM node:latest

SHELL ["/bin/bash", "-c"]

WORKDIR /app

COPY ./probmods .

RUN apt-get update
RUN apt-get -y install ruby-dev pkg-config libcairo2-dev libsdl-pango-dev libpng-dev libjpeg-dev libgif-dev
RUN npm update -g npm
RUN npm install -g browserify uglify-js watchify grunt-cli katex
RUN gem install jekyll
RUN npm install
RUN scripts/deploy-to-assets

EXPOSE 4000

ENTRYPOINT ["/bin/bash", "-c"]
