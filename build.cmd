REM------------------------------------------------------------
REM Fano Web Framework Skeleton Application (https://fano.juhara.id)
REM
REM @link      https://github.com/zamronypj/fano-app
REM @copyright Copyright (c) 2018 Zamrony P. Juhara
REM @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 2.0)
REM-------------------------------------------------------------

REM ------------------------------------
REM -- build script for Windows
REM ------------------------------------

SET FANO_DIR="fano"

if NOT DEFINED BUILD_TYPE (SET BUILD_TYPE="prod")
if NOT DEFINED USER_APP_DIR (SET USER_APP_DIR="app")
if NOT DEFINED UNIT_OUTPUT_DIR (SET UNIT_OUTPUT_DIR="bin/unit")
if NOT DEFINED EXEC_OUTPUT_DIR (SET EXEC_OUTPUT_DIR="app/public")
if NOT DEFINED EXEC_OUTPUT_NAME (SET EXEC_OUTPUT_NAME="app.cgi")
if NOT DEFINED SOURCE_PROGRAM_NAME (SET SOURCE_PROGRAM_NAME="app.pas")

fpc @fano/fano.cfg @build.cfg %USER_APP_DIR%/%SOURCE_PROGRAM_NAME%
