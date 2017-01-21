FROM node:6.9.4 # Karma experienced runtime issues with node v7.4
MAINTAINER Lewis Rodgers <contact@lewisrodgers.com>

# Install build and testing tools
# The addition of the .bowerrc file is a convenience so you
# don't have to remember to include it from the source code.
# It's necessary to be able to run bower in the container.
RUN npm i -g grunt-cli bower karma \
    && npm i karma-jasmine karma-phantomjs-launcher karma-spec-reporter \
    && echo '{ "allow_root": true }' > /root/.bowerrc

WORKDIR /app

CMD ["bash"]
