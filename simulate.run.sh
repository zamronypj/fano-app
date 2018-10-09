#!/bin/bash

CURRDIR=$PWD

# change current working dir, to simulate how cgi
# app executed by web server
cd app/public

REQUEST_METHOD=GET \
REQUEST_URI=/ \
./app.cgi

cd $CURRDIR
