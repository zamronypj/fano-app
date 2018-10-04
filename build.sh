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

if [[ -z "${UNIT_OUTPUT_DIR}" ]]; then
    export UNIT_OUTPUT_DIR="bin/unit"
fi

if [[ -z "${EXEC_OUTPUT_DIR}" ]]; then
export EXEC_OUTPUT_DIR="app/cgi-bin"
fi

if [[ -z "${EXEC_OUTPUT_NAME}" ]]; then
export EXEC_OUTPUT_NAME="app.cgi"
fi

if [[ -z "${SOURCE_PROGRAM_NAME}" ]]; then
SOURCE_PROGRAM_NAME="app.pas"
fi

fpc @fpc.cfg @build.cfg ${USER_APP_DIR}/${SOURCE_PROGRAM_NAME}
