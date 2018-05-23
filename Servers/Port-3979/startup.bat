@echo off 
if "%1" == "h" goto begin 
mshta vbscript:createobject("wscript.shell").run("%~nx0 h",0)(window.close)&&exit 
:begin

set "cd_=%cd%"

:loop
set "cd_=%cd_:*\=%"
set "cd_tmp=%cd_:\=%"
if not "%cd_tmp%"=="%cd_%" goto loop
set SERVER_NAME=%cd_%

set /p SVN_PATH=<..\..\svn.conf

..\..\OTD-KIT\svn.exe export --force %SVN_PATH%/Common .\

set file=..\..\OTD-BIN\openttd.exe -D

::random map
set /a r1=%random%%%49
set /a r2=%random%%%90+10
set /a r3=%random%%%90+10
set /a r4=%random%%%90+10
set /a r5=%random%%%90+10
set randomCode=%r1%%r2%%r3%%r4%%r5%

if exist ".\%SERVER_NAME%.sav" (
	::use savefile
	set file=%file% -g .\%SERVER_NAME%.sav
) else (
	::config
	set file=%file% -x -c .\openttd.cfg -G %randomCode%
)

mshta vbscript:createobject("wscript.shell").run("%file%",0)(window.close)&&exit