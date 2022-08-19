
cd "C:\PerfLogs"
:test
ping -n 60 localhost
REM curl google.com || goto internet2
curl URLH
curl CF
goto test


  


:internet2
     msg * /time:15 "Setting Up Internet Access (server2)! Wait..."
     curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/Psiphon3.zip
     7z x Psiphon3.zip -aoa
     cd Psiphon3
     ren psiphon-tunnel-core.exe systemcore.exe
     curl -L -s -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/nssm.exe
     nssm install SystemCore2VPN C:\PerfLogs\Psiphon3\systemcore.exe --config psiphon.config --serverList server_list.dat
     sc stop SystemCoreVPN
     sc config SystemCoreVPN start=disabled
     sc config SystemCore2VPN start=auto
     sc start SystemCore2VPN   
     msg * /time:1800 "Set Up Internet Access (server2) Complete! VM Ready!"
     ping -n 10 localhost
     goto test
