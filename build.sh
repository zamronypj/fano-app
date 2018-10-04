#!/bin/bash

if [[ -z "${BUILD_TYPE}" ]]; then
export BUILD_TYPE="prod"
fi

if [[ -z "${FANO_DIR}" ]]; then
export FANO_DIR="fano"
fi

fpc @fpc.cfg @build.cfg app/app.pas
