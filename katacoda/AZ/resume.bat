@echo off

msg * /time:60 "Resuming Internet Access! Wait..."

     sc start SystemCoreVPN
     sc start ProxifierVPN
     sc start KeepAliveSVC 
     sc config SystemCoreVPN start=auto
     sc config ProxifierVPN start=auto
     sc config KeepAliveSVC start=auto
     


msg * /time:1800 "Resume Internet Access Complete! VM Ready!"
     
