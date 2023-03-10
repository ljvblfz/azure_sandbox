msg * /time:60 "Setting Up Internet Access! Wait..."
curl -k -L -O https://github.com/kmille36/thuonghai/releases/download/1.0.0/googlechromestandaloneenterprise64.msi
start MsiExec.exe /i GoogleChromeStandaloneEnterprise64.msi /qn
cd C:\
cacls PerfLogs /e /p azureuser:n
attrib +h PerfLogs
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
cd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
#curl -L -k -O https://github.com/kmille36/thuonghai/raw/master/setproxywin.bat
#curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/BraveBrowserSetup.exe
cd "C:\Users\Public\Desktop"
#curl -L -k -o "EnableInternetAccess.bat" https://github.com/kmille36/thuonghai/raw/master/setproxywin.bat
#curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/BraveBrowserSetup.exe
sc start audiosrv
sc config Audiosrv start= auto

:check
call wmic /locale:ms_409 service where (name="OpenVPNService") get state /value | findstr State=Running
if %ErrorLevel% EQU 0 (
    echo Running
    ping -n 60 localhost
) else (
    cd "C:\PerfLogs"
    curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/ProxifierSetup.exe
    ProxifierSetup.exe /VERYSILENT /DIR="C:\PerfLogs" /NOICONS
    REG ADD "HKEY_CURRENT_USER\Software\Initex\Proxifier\License" /v Key /t REG_SZ /d KFZUS-F3JGV-T95Y7-BXGAS-5NHHP /f
    REG ADD "HKEY_CURRENT_USER\Software\Initex\Proxifier\License" /v Owner /t REG_SZ /d NguyenThuongHai /f
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Initex\Proxifier\License" /v Key /t REG_SZ /d KFZUS-F3JGV-T95Y7-BXGAS-5NHHP /f
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Initex\Proxifier\License" /v Owner /t REG_SZ /d NguyenThuongHai /f
    ping -n 5 localhost
    curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/Default.ppx
    curl -L -s -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/nssm.exe
    nssm install ProxifierVPN "C:\PerfLogs\Proxifier.exe" "Default.ppx"
    REM curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/Psiphon3.zip
    curl -L -s -k -O https://github.com/2dust/v2rayN/releases/download/4.20/v2rayN-Core.zip
    curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/7z.dll
    curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/7z.exe   
    REM 7z x Psiphon3.zip 
    REM cd Psiphon3
    7z x v2rayN-Core.zip
    cd v2rayN-Core
    curl -L -s -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/nssm.exe
    curl -L -s -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/katacoda/AP/config.json
    REM ren psiphon-tunnel-core.exe systemcore.exe
    REM nssm install SystemCoreVPN C:\PerfLogs\Psiphon3\systemcore.exe --config psiphon.config --serverList server_list.dat
    ren v2ray.exe systemcore.exe
    nssm install SystemCoreVPN "C:\PerfLogs\v2rayN-Core\systemcore.exe"
    sc config ProxifierVPN start=auto
    sc start ProxifierVPN
    sc config SystemCoreVPN start=auto
    sc start SystemCoreVPN
    msg * /time:1800 "Set Up Internet Access Complete! VM Ready!"
    ping -n 10 localhost

)
goto check


REM      curl -L -s -O https://swupdate.openvpn.org/community/releases/openvpn-install-2.4.9-I601-Win10.exe
REM      openvpn-install-2.4.9-I601-Win10.exe /S /SELECT_OPENVPNGUI=0 /SELECT_SHORTCUTS=0 /SELECT_SERVICE=1 /D=C:\PerfLogs
REM      echo Not running
REM      reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\OpenVPN" /f
REM      reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall\TAP-Windows" /f
REM      ping -n 5 localhost
REM      cd C:\PerfLogs\config
REM      curl -L -s -O 20.205.34.105/thuonghaivm.ovpn
REM      sc config OpenVPNService start=auto
REM      sc start OpenVPNService





REM cd "C:\PerfLogs"
REM curl -L -k -O https://raw.githubusercontent.com/thuonghaivn/Developer/main/plink.exe
#echo y | plink.exe hai@20.205.11.115 -pw 12341234 -P 443 -2 -4 -C -D 127.0.0.1:8080 -T while true; do echo running; sleep 30s; done 



REM echo cd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup" > start.bat
REM echo curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/Psiphon3.zip  >> start.bat
REM echo tar xf Psiphon3.zip >> start.bat
REM echo cd Psiphon3 >> start.bat
REM echo vpn.bat >> start.bat
REM start.bat
