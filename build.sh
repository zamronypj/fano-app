#!/bin/bash

if [[ -z "${BUILD_TYPE}" ]]; then
export BUILD_TYPE="prod"
fi

if [[ -z "${FANO_DIR}" ]]; then
export FANO_DIR="fano"
fi

if [[ -z "${USER_APP_DIR}" ]]; then
export USER_APP_DIR="app"
fi

fpc @fpc.cfg @build.cfg ${USER_APP_DIR}/app.pas
