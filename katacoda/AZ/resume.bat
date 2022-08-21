@echo off

SC QUERY KeepAliveSVC > NUL
IF ERRORLEVEL 1060 GOTO setup

cd "C:\PerfLogs"
move config.json v2rayN-Core

msg * /time:60 "Resuming Internet Access! Wait..."
    

     sc config SystemCoreVPN start=auto
     sc config ProxifierVPN start=auto
     sc config KeepAliveSVC start=auto
     sc start SystemCoreVPN
     sc start ProxifierVPN
     sc start KeepAliveSVC 
     


msg * /time:1800 "Resume Internet Access Complete! VM Ready!"

: setup
curl -k -L -O https://raw.githubusercontent.com/kmille36/thuonghai/master/katacoda/AZ/internet.bat
start internet.bat
