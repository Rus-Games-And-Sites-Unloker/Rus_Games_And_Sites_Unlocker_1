:: Сделано Dronatar для zapret-discord-youtube версии 1.7.2b
:: За основу взяты general (ALT2) из https://github.com/Flowseal/zapret-discord-youtube/releases
:: и discord (ALT2) из https://github.com/Flowseal/zapret-discord-youtube/discussions/252#discussioncomment-13422081

@echo off
title zapret: general (ALT6)

cd /d "%~dp0..\"
set "BIN=%~dp0..\bin\"
set "LISTS=%~dp0..\lists\"

start "zapret: AltUlitimate (ALT6)" /min "%BIN%winws.exe" --wf-tcp=80,443 --wf-udp=443,50000-50099,0-65535 ^

--comment Discord(Calls) --filter-udp=50000-50099 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-fake-discord=0x00 --dpi-desync-fake-stun=0x00 --dpi-desync-repeats=6 --new^

--comment Discord --filter-tcp=443 --hostlist="%LISTS%list-discord.txt" --hostlist-domains=cdn.discordapp.com,gateway.discord.gg,images-ext-1.discordapp.net,media.discordapp.net --dpi-desync=fake --dpi-desync-fake-tls-mod=none --dpi-desync-repeats=6 --dpi-desync-fooling=badseq,hopbyhop2 --new^

--comment YouTube(QUIC) --filter-udp=443 --hostlist="%LISTS%list-ultimate.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new^

--comment YouTube(Streaming) --filter-tcp=80 --hostlist="%LISTS%list-ultimate.txt" --dpi-desync=fake,split2 --dpi-desync-fooling=md5sig --new^

--filter-tcp=443 --hostlist-exclude="%LISTS%list-discord.txt" --hostlist="%LISTS%list-ultimate.txt" --hostlist-domains=adguard.com,adguard-vpn.com,totallyacdn.com,whiskergalaxy.com,windscribe.com,windscribe.net,cloudflareclient.com,soundcloud.com,sndcdn.com,soundcloud.cloud --dpi-desync=split2 --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-repeats=2 --dpi-desync-fooling=badseq,hopbyhop2 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_www_google_com.bin" --new^

--comment Cloudflare WARP(1.1.1.1, 1.0.0.1) --filter-tcp=443 --ipset-ip=162.159.36.1 --filter-l7=tls --dpi-desync=fake --dpi-desync-fake-tls=0x00 --dpi-desync-start=n2 --dpi-desync-cutoff=n3 --dpi-desync-fooling=md5sig --new^

--comment WireGuard --filter-udp=0-65535 --filter-l7=wireguard --dpi-desync=fake --dpi-desync-fake-wireguard=0x00 --dpi-desync-cutoff=n2 --new^

--filter-udp=443 --ipset="%LISTS%ipset-all.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new^

--filter-tcp=80 --ipset="%LISTS%ipset-all.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new^

--filter-tcp=443 --ipset="%LISTS%ipset-all.txt" --dpi-desync=split2 --dpi-desync-split-seqovl=681 --dpi-desync-split-seqovl-pattern="%BIN%tls_clienthello_www_google_com.bin"