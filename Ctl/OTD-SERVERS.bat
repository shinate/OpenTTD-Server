@echo off 
if "%1" == "h" goto begin 
mshta vbscript:createobject("wscript.shell").run("%~nx0 h",0)(window.close)&&exit 
:begin
set /p SVN_PATH=<.\svn.conf
if not exist ".\OTD-BIN" (
	.\OTD-KIT\svn.exe export --force %SVN_PATH%/Bin .\OTD-BIN
)

.\OTD-KIT\svn.exe export --force %SVN_PATH%/Servers .\OTD-SERVERS