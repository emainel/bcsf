#bin/bash

echo -e "\e[1;33m Checking System Now \e[0"

uname -a

function auth(){
echo "Authentication Logs"
echo " "
tail -1000 /var/log/auth.log
}


function apt_logs(){
echo "Apt Logs "
echo " "
tail -1000 /var/log/apt/history.log

}
function kern_logs(){
echo "kern logs "
echo " "
tail -1000 /var/log/kern.log
}
function Boot_logs(){
echo "Boot logs "
echo " "
tail -1000 /var/log/boot.log 
}

echo " What Logs Do you want to see"
echo "[1] For Authentication Logs"
echo "[2] For Apt Logs"
echo "[3] For Kern logs"
echo "[4] For Boot logs"
read ad

if [[ $ad -eq 1 ]]; then
	auth
elif [[ $ad -eq 2 ]]; then
	apt_logs
elif [[ $ad -eq 3 ]]; then
        kern_logs
elif [[ $ad -eq 4 ]]; then
        Boot_logs

else
echo " Quiting"
fi
