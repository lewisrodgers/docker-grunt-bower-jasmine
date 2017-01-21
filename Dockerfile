FROM node:6

# Install PhantomJS for headless browser testing
ENV PHANTOMJS_VERSION 2.1.1
ENV PHANTOMJS_DIR /phantomjs
ENV PATH $PHANTOMJS_DIR/bin:$PATH

RUN mkdir -p $PHANTOMJS_DIR \
    && wget --local-encoding=UTF-8 -O $PHANTOMJS_DIR/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2" \
    && tar -xaf $PHANTOMJS_DIR/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 --strip-components=1 --directory "$PHANTOMJS_DIR" \
    && rm -f $PHANTOMJS_DIR/phantomjs*

# Set node_modules path
ENV NODE_PATH /install/node_modules/
ENV PATH /install/node_modules/.bin:$PATH

# Install global node packages
# Bower cannot be run with sudo so we set `allow_root` to true
# in the `.bowerrc` configuration. It's baked into the image
# as a convenience.
RUN npm i -g grunt-cli bower karma-cli \
    && echo '{ "allow_root": true }' > /root/.bowerrc

# Install node packages
WORKDIR /install/
RUN npm i \
    jasmine-core \
    karma \
    karma-chrome-launcher \
    karma-phantomjs-launcher \
    karma-jasmine \
    karma-spec-reporter

# Set the expected app folder
VOLUME /app
WORKDIR /app

CMD ["bash"]
