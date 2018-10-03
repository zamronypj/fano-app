# Fano Web Framework

Pascal web application framework

## Requirement

- FreePascal >= 3.0
- Web Server (Apache, nginx)

## Installation

### Build
Copy `build.cfg.sample` to `build.cfg`. Make adjustment as you need and run `build.sh` shell script.

    $ cp build.cfg.sample build.cfg
    $ ./build.sh

By default, it will output binary executable in `public` directory.

## Run

### Run with a webserver

Setup a virtual host. Please consult documentation of web server you use.

### Simulate run on command line

    $ REQUEST_METHOD=GET \
      REQUEST_URI=/test/test \
      SERVER_NAME=juhara.com \
      ./public/app.cgi
