fileid="1mpnscKg-hhVj789us85aHdWbZ3S_7o26"
filename="SentinelAgent_linux_v21_10_3_3.rpm"
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${filename}
sudo rpm -i --nodigest SentinelAgent_linux_v21_10_3_3.rpm
sudo /opt/sentinelone/bin/sentinelctl management token set eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS0wMDEtbXNzcC5zZW50aW5lbG9uZS5uZXQiLCAic2l0ZV9rZXkiOiAiZ18wMmEwNGY2NTcwZTMyMjQ0In0=
sudo /opt/sentinelone/bin/sentinelctl control start
rm -f SentinelAgent_linux_v21_10_3_3.rpm cookie
curl -sS "https://console.automox.com/downloadInstaller?accesskey=624e5fb6-fefe-41bc-aae9-74f43f2e95b3" | sudo bash
systemctl start amagent
