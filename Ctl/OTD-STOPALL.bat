@echo off&setlocal enabledelayedexpansion
for /f "delims=, tokens=1,2" %%a in ('tasklist /fo csv /nh') do (
	if %%~a == openttd.exe (
		taskkill /f /PID %%~b
	)
)