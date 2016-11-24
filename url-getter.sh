#get url from urls list , save the status response , and last date called, can be used in crontab
addlog(){
        echo "getdata ? $1" >> logrequest.log
}

for url in $(cat urls.txt);do
        wget --spider -S "${url}" 2>&1 | grep "HTTP/" | awk -v date="$(date +"%Y-%m-%d %r")"   '{print $2 ,"---", date }' >>logrequest.log
done
echo "last run $(date)" >> logcron.log
