//用于在局域网内发送弹窗。
//版本：0.1（有更新的版本）

@echo off
set /p name=Content:
set /p sip=IP Address:

>nul2>&1"%SYSTEMROOT%\system32\cacls.exe""%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto gotAdmin)

:UACPrompt

echo SetUAC=CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"

echo UAC.ShellExecute"%~s0","","","runas",1>>"%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"

exit /b

:gotAdmin

if exist "%temp%\getadmin.vbs" (del"%temp%\getadmin.vbs")

//set name=%~n0

MSG /server:%sip% * %name%

MSG /server:127.0.0.1 * "Send successfully!"
