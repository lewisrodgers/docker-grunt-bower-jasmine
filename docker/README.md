## Usage
Kick-off the build tasks and start the testing server.

```
docker run -it --rm -v $(pwd):/app IMAGE grunt watch
```

## Configuration
This image includes the following tools:
- [Grunt](http://gruntjs.com/)
- [Bower](https://bower.io/)
- [Karma](http://karma-runner.github.io/1.0/index.html)
- [Jasmine](https://jasmine.github.io/)
- [PhantomJS](http://phantomjs.org/)
