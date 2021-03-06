@REM ----------------------------------------------------------------------------
@REM Copyright 2001-2004 The Apache Software Foundation.
@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM      http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM ----------------------------------------------------------------------------
@REM

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\springframework\boot\spring-boot-starter-web\1.3.5.RELEASE\spring-boot-starter-web-1.3.5.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter\1.3.5.RELEASE\spring-boot-starter-1.3.5.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot\1.3.5.RELEASE\spring-boot-1.3.5.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-autoconfigure\1.3.5.RELEASE\spring-boot-autoconfigure-1.3.5.RELEASE.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-logging\1.3.5.RELEASE\spring-boot-starter-logging-1.3.5.RELEASE.jar;"%REPO%"\ch\qos\logback\logback-classic\1.1.7\logback-classic-1.1.7.jar;"%REPO%"\ch\qos\logback\logback-core\1.1.7\logback-core-1.1.7.jar;"%REPO%"\org\slf4j\slf4j-api\1.7.21\slf4j-api-1.7.21.jar;"%REPO%"\org\slf4j\jcl-over-slf4j\1.7.21\jcl-over-slf4j-1.7.21.jar;"%REPO%"\org\slf4j\jul-to-slf4j\1.7.21\jul-to-slf4j-1.7.21.jar;"%REPO%"\org\slf4j\log4j-over-slf4j\1.7.21\log4j-over-slf4j-1.7.21.jar;"%REPO%"\org\springframework\spring-core\4.2.6.RELEASE\spring-core-4.2.6.RELEASE.jar;"%REPO%"\org\yaml\snakeyaml\1.16\snakeyaml-1.16.jar;"%REPO%"\org\springframework\boot\spring-boot-starter-validation\1.3.5.RELEASE\spring-boot-starter-validation-1.3.5.RELEASE.jar;"%REPO%"\org\hibernate\hibernate-validator\5.2.4.Final\hibernate-validator-5.2.4.Final.jar;"%REPO%"\javax\validation\validation-api\1.1.0.Final\validation-api-1.1.0.Final.jar;"%REPO%"\org\jboss\logging\jboss-logging\3.3.0.Final\jboss-logging-3.3.0.Final.jar;"%REPO%"\com\fasterxml\classmate\1.1.0\classmate-1.1.0.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-databind\2.6.6\jackson-databind-2.6.6.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-annotations\2.6.6\jackson-annotations-2.6.6.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-core\2.6.6\jackson-core-2.6.6.jar;"%REPO%"\org\springframework\spring-web\4.2.6.RELEASE\spring-web-4.2.6.RELEASE.jar;"%REPO%"\org\springframework\spring-aop\4.2.6.RELEASE\spring-aop-4.2.6.RELEASE.jar;"%REPO%"\aopalliance\aopalliance\1.0\aopalliance-1.0.jar;"%REPO%"\org\springframework\spring-beans\4.2.6.RELEASE\spring-beans-4.2.6.RELEASE.jar;"%REPO%"\org\springframework\spring-context\4.2.6.RELEASE\spring-context-4.2.6.RELEASE.jar;"%REPO%"\org\springframework\spring-webmvc\4.2.6.RELEASE\spring-webmvc-4.2.6.RELEASE.jar;"%REPO%"\org\springframework\spring-expression\4.2.6.RELEASE\spring-expression-4.2.6.RELEASE.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\8.0.28\tomcat-embed-el-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\8.0.28\tomcat-embed-core-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-logging-juli\8.0.28\tomcat-embed-logging-juli-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-jasper\8.0.28\tomcat-embed-jasper-8.0.28.jar;"%REPO%"\org\eclipse\jdt\core\compiler\ecj\4.4.2\ecj-4.4.2.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper\8.0.28\tomcat-jasper-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-servlet-api\8.0.28\tomcat-servlet-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-juli\8.0.28\tomcat-juli-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-el-api\8.0.28\tomcat-el-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-api\8.0.28\tomcat-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-util-scan\8.0.28\tomcat-util-scan-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-util\8.0.28\tomcat-util-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper-el\8.0.28\tomcat-jasper-el-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-jsp-api\8.0.28\tomcat-jsp-api-8.0.28.jar;"%REPO%"\com\heroku\sample\embeddedTomcatSample\1.0-SNAPSHOT\embeddedTomcatSample-1.0-SNAPSHOT.jar
set EXTRA_JVM_ARGUMENTS=
goto endInit

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% %EXTRA_JVM_ARGUMENTS% -classpath %CLASSPATH_PREFIX%;%CLASSPATH% -Dapp.name="webapp" -Dapp.repo="%REPO%" -Dbasedir="%BASEDIR%" launch.Main %CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=1

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@endlocal

:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
