#!/bin/bash

CURRDIR=$PWD

# change current working dir, to simulate how cgi
# app executed by web server
cd app/public

if [ -z "$REQUEST_METHOD" ]; then
    export REQUEST_METHOD="GET"
fi

if [ -z "$REQUEST_URI" ]; then
    export REQUEST_URI="/"
fi

./app.cgi

cd $CURRDIR
