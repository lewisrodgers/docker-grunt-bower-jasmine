## Usage
First, in a terminal, navigation to the root folder where the `docker-compose.yaml` exists and build the image. 

```bash
$ docker-compose build
```

Navigate to the target project folder. Important: The container expects grunt and karma config files and a src folder structure based on [ngBoilerplate](https://github.com/ngbp/ngbp). 

```
$ cd [target/project/folder]
```

Run the container to kick-off the build tasks and start the test runner.

```
$ docker run -it --rm -v $(pwd):/home/app [IMAGE]
```

## Configuration
This image includes the following:
- [ngBoilerplate](https://github.com/ngbp/ngbp) (customized)
    - Coffee script/lint and changelog related configuration have been omitted.
    - Karma has been configured to launch PhantomJS instead of Firefox.
- [Grunt](http://gruntjs.com/)
- [Bower](https://bower.io/)
- [Karma](http://karma-runner.github.io/1.0/index.html)
    - [Jasmine](https://jasmine.github.io/)
    - [PhantomJS](http://phantomjs.org/)
