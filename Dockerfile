FROM node:6

MAINTAINER Lewis Rodgers <contact@lewisrodgers.com>

ENV HOME /home/app

RUN useradd --user-group --create-home --shell /bin/false app \
    && npm install --global grunt-cli bower karma

COPY package.json npm-shrinkwrap.json bower.json .bowerrc $HOME/
RUN chown --recursive app:app $HOME/*

USER app
WORKDIR $HOME
RUN npm install && npm cache clean \
    && bower install && bower cache clean

CMD ["bash"]
