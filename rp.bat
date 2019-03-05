@echo off
:: cls
:: ==========    Ruby path Changer   ==============================
:: This script rewrites the path of multiple versions of Ruby. 
:: 
:: ==========    Required setting before your use    ==============
:: Please write the target Ruby PATH in this file before starting. 
:: You need to write all Ruby versions you want to switch. 
:: 
:: The Ruby path of the Windows environment variable should be 
:: set to the default Ruby path only.
:: 
:: There is no function to register installed Ruby automatically.
:: 
:: ================================================================
:: ==========    Start configuration    ===========================
:: Please write your settings in the following items 1, 2 and 3.
:: 
:: [1] default Ruby PATH
set DEFDIR=C:\Ruby25-x64\bin

:: [2] Write a list of the paths you want to switch.
:: The first letter is always "R".
:: The next number means the argument to be used when switching.
:: Write the path to the right of "=".
set R24=C:\Ruby24-x64\bin
set R25=C:\Ruby25-x64\bin
set R26=C:\Ruby26-x64\bin

:: [3] Write the number of the version to switch.
set R_LIST=24 25 26

:: ==========    End configuration    ================================
:: ===================================================================


:: [name]: Rewrite the path to the matched version
for %%x in (%R_LIST%) do (
  if "%1"=="%%x" goto SET_PATH
)

:: [list]: Show list of name and Ruby versions
if "%1"=="list" (
  echo Available Ruby version:
  echo.
  echo Name: Ruby version
  for %%i in (%R_LIST%) do (
    for /f "delims==" %%x in ('%%R%%i%%\ruby -v') do (
      echo %%i : %%x
    )
  )
  goto EXIT
)

:: Show help if no argument
echo ==============================================
echo ======= ^<^<  rp: Ruby Path Changer ^>^> =======
echo.  
echo  [ How to use: ]
echo  ^> rp ^<name^>   
echo.
echo  [ If you want to change to ruby2.5 ] 
echo  ^>rp 25
echo.
echo  [ Display available list: ]
echo  ^>rp list
echo.
for /f "delims==" %%x in ('rp list') do echo %%x
echo.
echo  [ Current Ruby version: ]
ruby -v
echo.
echo ==============================================
goto EXIT

:: Rewrite PATH
:SET_PATH
if "%NEWDIR%" == "" (
  set OLDDIR=%DEFDIR%
) else (
  set OLDDIR=%NEWDIR%
)

set DIRTMP=R%1
call set DIRNAME=%%%DIRTMP%%%
set NEWDIR=%DIRNAME%

:: Check Ruby PATH
PATH | findstr.exe /L Ruby >nul 2>nul
if %ERRORLEVEL% == 0 goto REP_PATH

:ADD_PATH
echo Add Ruby PATH
PATH=%DEFDIR%;%PATH%

:REP_PATH
echo Replace Ruby PATH:
call PATH %%PATH:%OLDDIR%=%NEWDIR%%%

echo %OLDDIR% =^> %NEWDIR%
set NEWPROMPT=%DIRTMP%
prompt [%NEWPROMPT%]:$l$p$g$_$g
title [%NEWPROMPT%] = %NEWDIR%
echo.
echo Current Ruby version:
ruby -v

:EXIT
echo on