# Fano Web Framework

Pascal web application framework

## Requirement

- [FreePascal](https://www.freepascal.org/) >= 3.0
- Web Server (Apache, nginx)

## Installation

### Build

Copy `*.cfg.sample` to `*.cfg`. Make adjustment as you need in
`build.cfg`, `build.prod.cfg`, `build.dev.cfg` and run `build.sh` shell script.

    $ cp build.prod.cfg.sample build.prod.cfg
    $ cp build.dev.cfg.sample build.dev.cfg
    $ cp build.cfg.sample build.cfg
    $ ./build.sh

By default, it will output binary executable in `public` directory.

### Build for different environment

To build for different environment, set `BUILD_TYPE` environment variable.

#### Build for production environment

    $ BUILD_TYPE=prod ./build.sh

Build process will use compiler configuration defined in `build.cfg` and `build.prod.cfg`.

#### Build for development environment

    $ BUILD_TYPE=dev ./build.sh

Build process will use compiler configuration defined in `build.cfg` and `build.dev.cfg`.

If `BUILD_TYPE` environment variable is not set, production environment will be assumed.

## Change Fano Web Framework Directory

By default, Fano web framework units reside in `fano` directory. If you choose
to move it to different location, you can set `FANO_DIR` environment variable

    $ FANO_DIR=/path/to/fano ./build.sh

## Run

### Run with a webserver

Setup a virtual host. Please consult documentation of web server you use.

### Simulate run on command line

    $ REQUEST_METHOD=GET \
      REQUEST_URI=/test/test \
      SERVER_NAME=juhara.com \
      ./public/app.cgi
