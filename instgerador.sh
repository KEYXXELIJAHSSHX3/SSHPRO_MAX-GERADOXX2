#!/bin/bash
#====================================================
#
#  Modificaciones Al Codigo: Elijah_ssh
#  https://t.me/Elijahssh
#
#====================================================
clear
[[ "$(whoami)" != "root" ]] && {
echo -e "\033[1;33m[\033[1;31mErro\033[1;33m] \033[1;37m- \033[1;33mvocê precisa executar como root\033[0m"
rm $HOME/instgerador.sh* > /dev/null 2>&1; exit 0
}
barra="\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

cd $HOME
    rm $HOME/.bash_history >/dev/null 2>&1
    rm $HOME/wget-hsts >/dev/null 2>&1
fun_bar () {
comando[0]="$1"
comando[1]="$2"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
 tput civis
echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
while true; do
   for((i=0; i<18; i++)); do
   echo -ne "\033[1;34m#"
   sleep 0.1s
   done
   [[ -e $HOME/fim ]] && rm $HOME/fim && break
   echo -e "\033[1;33m]"
   sleep 1s
   tput cuu1
   tput dl1
   echo -ne "  \033[1;33mAGUARDE \033[1;37m- \033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}

fun_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}

fun_attrepo () {
    apt-get update -y
    apt-get upgrade -y   
        _pacotes=("bc" "screen" "nano" "unzip" "lsof" "netstat" "net-tools" "dos2unix" "nload" "jq" "curl" "figlet" "python3" "python-pip" "python" "at")
        for _prog in ${_pacotes[@]}; do
            apt install $_prog -y
        done       
    [[ -f "/usr/sbin/ufw" ]] && ufw allow 443/tcp
    ufw allow 80/tcp
    ufw allow 3128/tcp
    ufw allow 8799/tcp
    ufw allow 8080/tcp   
    apt-get install python -y >/dev/null 2>&1
    apt-get install python2 -y >/dev/null 2>&1
    apt-get install python3.6 -y >/dev/null 2>&1
    apt-get install python3.7 -y >/dev/null 2>&1
    apt-get install python3.8 -y >/dev/null 2>&1
    apt-get install python3.9 -y >/dev/null 2>&1
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1 >/dev/null 2>&1
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 3 >/dev/null 2>&1
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2 >/dev/null 2>&1
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 4 >/dev/null 2>&1
    apt install pip -y
    apt install python3-pip -y
    apt install socat -y
}

fun_lisa () {
echo -e "America/Sao_Paulo" >/etc/timezone
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime >/dev/null 2>&1
dpkg-reconfigure --frontend noninteractive tzdata >/dev/null 2>&1
[[ ! -d /etc/SSHPlus ]] && mkdir /etc/SSHPlus
[[ ! -d /etc/SSHPlus/v2ray ]] && mkdir /etc/SSHPlus/v2ray
[[ ! -d /etc/SSHPlus/senha ]] && mkdir /etc/SSHPlus/senha
[[ ! -e /etc/SSHPlus/Exp ]] && touch /etc/SSHPlus/Exp
[[ ! -d /etc/SSHPlus/.tmp ]] && mkdir /etc/SSHPlus/.tmp
[[ ! -d /etc/bot ]] && mkdir /etc/bot
[[ ! -d /etc/bot/revenda ]] && mkdir /etc/bot/revenda
[[ ! -e /etc/bot/lista_ativos ]] && touch /etc/bot/lista_ativos
netstat -nplt | grep -w 'apache2' | grep -w '80' && sed -i "s/Listen 80/Listen 81/g" /etc/apache2/ports.conf && service apache2 restart
[[ "$(grep -o '#Port 22' /etc/ssh/sshd_config)" == "#Port 22" ]] && sed -i "s;#Port 22;Port 22;" /etc/ssh/sshd_config && service ssh restart
_arq_host="/etc/hosts"
_host[0]="d1n212ccp6ldpw.cloudfront.net"
_host[1]="dns.whatsapp.net"
_host[2]="portalrecarga.vivo.com.br/recarga"
_host[3]="navegue.vivo.com.br/controle/"
_host[4]="navegue.vivo.com.br/pre/"
_host[5]="www.whatsapp.net"
_host[6]="/SSHPLUS?"
for host in ${_host[@]}; do
	if [[ "$(grep -w "$host" $_arq_host | wc -l)" = "0" ]]; then
		sed -i "3i\127.0.0.1 $host" $_arq_host
	fi
done
[[ ! -e /etc/autostart ]] && {
	echo '#!/bin/bash
clear
#INICIO AUTOMATICO' >/etc/autostart
	chmod +x /etc/autostart
} || {
	[[ $(ps x | grep "bot_plus" | grep -v grep | wc -l) != '0' ]] && wget -qO- https://raw.githubusercontent.com/shellscriptx/shellbot/master/ShellBot.sh >/etc/SSHPlus/ShellBot.sh
	for proc in $(ps x | grep 'dmS' | grep -v 'grep' | awk {'print $1'}); do
		screen -r -S "$proc" -X quit
	done
	screen -wipe >/dev/null
	echo '#!/bin/bash
clear
#INICIO AUTOMATICO' >/etc/autostart
	chmod +x /etc/autostart
}
crontab -r >/dev/null 2>&1
(
	crontab -l 2>/dev/null
	echo "@daily /bin/verifatt"
	echo "@reboot /etc/autostart"
	echo "* * * * * /etc/autostart"
	echo "0 */6 * * * /bin/uexpired"
) | crontab -
echo "$_lvk" | sed -n '1 p' | cut -d' ' -f2 >/bin/versao && cat /bin/versao >/home/sshplus
wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 >/dev/null 2>&1
chmod +x jq-linux64 && mv jq-linux64 $(which jq)
service cron restart >/dev/null 2>&1
service ssh restart >/dev/null 2>&1
[[ -d /var/www/html/openvpn ]] && service apache2 restart >/dev/null 2>&1
}

fun_instrec () {
    apt-get install curl -y
    apt-get install zip -y
    apt-get install unzip -y
    apt-get install apache2 -y
    apt install build-essential
    apt install shc build-essential
    snap install lolcat
}

fun_apalist () {
    sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
    service apache2 start
    service apache2 restart
    ## cp /var/www/html/index.html /var/www/html/index_back.html
}

fun_preparasis () {
    rm -rf /home/lisa
    rm -rf /home/index.html
    rm -rf /home/_script_$
    rm -rf /bin/keyscript
    rm -rf /bin/key
    rm -rf /bin/otimizar
    rm -rf /var/www/html/Index.php
    rm -rf /var/www/html/script
    rm -rf /var/www/html/promax
    rm -rf /var/www/html/1:8%7o.2sg3-q:5
    mkdir /home/keyscript
    mkdir /home/_script_$
    mkdir /home/_script_$/crz
    mkdir /var/www/html/script
    mkdir /var/www/html/promax
    mkdir /var/www/html/promax/Install
    mkdir /var/www/html/promax/up
    echo "/bin/keyssh" > /bin/key 
}

fun_downser () {
cd
cd /home/_script_$/crz
wget https://github.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/raw/main/Install/SSHPRO_MAX-v3.0.1.zip
unzip SSHPRO_MAX-v3.0.1.zip
rm -rf SSHPRO_MAX-v3.0.1.zip
cd
cd /home/_script_$/crz
wget https://github.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/raw/main/Modulos/versao
cd
cd /home/_script_$/
wget https://github.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/raw/main/Modulos/licence
cd

}

fun_instsis () {
wget -O /home/lisa https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/lisa
wget -O /home/index.html https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/index.html
wget -O /bin/keyscript https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/keyscript
wget -O /bin/otimizar https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/otimizar
wget -O /bin/ports.conf https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Install/ports.conf
wget -O /bin/ports2.conf https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Install/ports2.conf
wget -O /bin/bts0p https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/bts0p
wget -O /bin/gr0p https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/gr0p
wget -O /bin/inv0p https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/inv0p
wget -O /home/Get https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/Get
wget -O /home/Pro https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/Pro
wget -O /var/www/html/shop https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/shop
wget -O /var/www/html/promax/Install/cert https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/cert
wget -O /var/www/html/promax/Install/key https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/key
wget -O /var/www/html/promax/Install/stunnel https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/stunnel
wget -O /var/www/html/promax/versao https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/versao
wget -O /var/www/html/promax/Install/EasyRSA-3.0.1.tgz https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/EasyRSA-3.0.1.tgz
wget -O /var/www/html/script/versao https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/versao
wget -O /var/www/html/promax/update https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/update
wget -O /etc/bot/botscript https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/botscript
wget -O /etc/bot/ShellBot.sh https://raw.githubusercontent.com/KEYXXELIJAHSSHX3/SSHPRO_MAX-GERADOXX2/main/Modulos/ShellBot.sh
}

fun_permisoarq () {
    chmod +x  /home/lisa
    chmod +x  /home/Pro
    chmod +x  /home/index.html
    chmod +x  /bin/keyscript
    chmod +x  /bin/otimizar
    chmod +x /bin/key
    chmod +x  /home/Get
    chmod +x  /var/www/html/script/versao
    chmod 777 /home/_script_$/crz/versao
    chmod 777  /etc/bot/botscript
    chmod 777  /etc/bot/ShellBot.sh
    chmod 777  /etc/bot/lista_ativos
    chmod 777  /bin/bts0p
    chmod 777  /bin/gr0p
    chmod 777  /bin/inv0p
}

fun_montaip () {
fun_ip
sed -i "s;$IP;scriptpromax.elijahssh.shop;g" /home/lisa
fun_ip
sed -i "s;$IP;scriptpromax.elijahssh.shop;g" /home/index.html
sleep 3s
}

fun_finconf () {
cat /home/index.html >/home/_script_$/index.html
cat /home/index.html >/home/_script_$/crz/index.html
cat /home/index.html >/var/www/html/script/index.html
cat /home/index.html >/var/www/html/promax/index.html
}

clear
system=$(cat /etc/issue.net)
date=$(date '+%d-%m-%Y <> %H:%M:%S')
_hora=$(printf '%(%H:%M:%S)T')
echo -e "\033[1;32m▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬\033[1;97m ☆☆☆☆☆   \033[1;32m▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬"
echo -e "\033[44;1;97m▬▬▬▬▬▬▬▬▬▬▬▬▬▬ ●●● SSH PRO MAX ●●● ▬▬▬▬▬▬▬▬▬▬▬▬▬▬\033[1;36m\033[0m"
echo -e "\033[1;32m▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬\033[1;97m ☆☆☆☆☆   \033[1;32m▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬"
echo ""
echo -e "\033[97m$system         $date"
echo -e "\033[01;97m║ \033[44;1;97m▬▬▬▬▬ ● INSTALADOR GERADOR SSH PRO MAX ● ▬▬▬▬\033[0m \033[01;97m║"
echo ""
read -p "$(echo -e "\033[1;33mDESEJA CONTINUAR\033[1;33m? \033[1;33m[S/N]:\033[1;32m ")" -e -i s resp
[[ $resp = @(n|N) ]] && rm $HOME/instgerador.sh* && exit 0
echo
tput cuu1 && tput dl1
tput cuu1 && tput dl1
echo -e "\033[1;33mATUALIZANDO REPOSITÓRIOS..... \033[1;32mAGUARDE"
fun_bar 'fun_attrepo'
echo -e "\033[1;33mINCLIMENTANDO RECURSOS..... \033[1;32mAGUARDE"
fun_bar 'fun_lisa'
echo -e "\033[1;33mINSTALANDO RECURSOS.......... \033[1;32mAGUARDE"
fun_bar 'fun_instrec'
echo -e "\033[1;33mCONFIGURANDO APACHE.......... \033[1;32mAGUARDE"
fun_bar 'fun_apalist'
echo -e "\033[1;36mPREPARANDO SISTEMA........... \033[1;32mAGUARDE"
fun_bar 'fun_preparasis'
echo -e "\033[1;33mDONWLOAD SERVER.............. \033[1;32mAGUARDE"
fun_bar 'fun_downser'
echo -e "\033[1;36mINSTALANDO SISTEMA........... \033[1;32mAGUARDE"
fun_bar 'fun_instsis'
echo -e "\033[1;33mPERMISOS ARQUIVOS............ \033[1;32mAGUARDE"
fun_bar 'fun_permisoarq'
echo -e "\033[1;33mMONTANDO O SEU LINK-IP....... \033[1;32mAGUARDE"
fun_bar 'fun_montaip'
echo -e "\033[1;33mFINALIZANDO CONFIGURACION.... \033[1;32mAGUARDE"
fun_bar 'fun_finconf'
echo ""
echo -ne "\n\033[1;32mENTER \033[1;33mPARA IR AO \033[1;32mMENU!\033[0m"; read
    rm $HOME/instgerador.sh >/dev/null 2>&1
    rm $HOME/.bash_history >/dev/null 2>&1
    rm $HOME/wget-hsts >/dev/null 2>&1
keyscript
