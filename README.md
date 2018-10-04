# Fano Web Framework

Pascal web application framework

## Requirement

- [FreePascal](https://www.freepascal.org/) >= 3.0
- Web Server (Apache, nginx)

## Installation

### Build

Copy `*.cfg.sample` to `*.cfg`. Make adjustment as you need in
`build.cfg`, `build.prod.cfg`, `build.dev.cfg` and run `build.sh` shell script.

Also copy `app/config/config.json.sample` to `app/config/config.json`.

    $ cp app/config/config.json.sample app/config/config.json
    $ cp build.prod.cfg.sample build.prod.cfg
    $ cp build.dev.cfg.sample build.dev.cfg
    $ cp build.cfg.sample build.cfg
    $ ./build.sh

By default, it will output binary executable in `app/public` directory.

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

## Change executable output directory

Compilation will output executable to directory defined in `EXEC_OUTPUT_DIR`
environment variable. By default is `public` directory.

    $ EXEC_OUTPUT_DIR=/path/to/public/dir ./build.sh

## Change executable name

Compilation will use executable filename as defined in `EXEC_OUTPUT_NAME`
environment variable. By default is `app.cgi` filename.

    $ EXEC_OUTPUT_NAME=server.cgi ./build.sh

## Run

### Run with a webserver

Setup a virtual host. Please consult documentation of web server you use.

For example on Apache,

```
<VirtualHost *:80>
     ServerName www.example.com
     DocumentRoot /home/example/app/public

     ScriptAlias /cgi-bin/ "/home/example/app/cgi-bin/"

     <Directory "/home/example/app/cgi-bin/">
         Options +ExecCGI
         AddHandler cgi-script .cgi
     </Directory>

     <IfModule mod_rewrite.c>
         RewriteEngine On
         RewriteCond %{REQUEST_FILENAME} !-d
         RewriteCond %{REQUEST_FILENAME} !-f
         RewriteRule ^((?s).*)$ /cgi-bin/app.cgi?_url=/$1 [QSA,L]
     </IfModule>
</VirtualHost>
```

### Simulate run on command line

    $ REQUEST_METHOD=GET \
      REQUEST_URI=/test/test \
      SERVER_NAME=juhara.com \
      ./public/app.cgi
