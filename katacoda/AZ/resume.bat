@echo off

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
     
