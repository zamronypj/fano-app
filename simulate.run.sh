#!/bin/bash

CURRDIR=$PWD

cd app/public

REQUEST_METHOD=GET \
REQUEST_URI=/ \
./app.cgi

cd $CURRDIR
