@echo off
chcp 65001 >nul

cd /d "%~dp0..\"
set BIN=%~dp0..\bin\

set LIST_TITLE=ZAPRET: Discord Fix MGTSV2 
set LIST_PATH=%~dp0..\lists\list-discord.txt
set IPSET_PATH=%~dp0..\lists\ipset-all.txt

start "%LIST_TITLE%" /min "%BIN%winws.exe" ^
--wf-tcp=443 --wf-udp=443,50000-65535 ^
--filter-udp=443 --hostlist="%LIST_PATH%" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new ^
--filter-udp=50000-65535 --ipset="%IPSET_PATH%" --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=6 --new ^
--filter-tcp=443 --hostlist="%LIST_PATH%" --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=6  --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin"