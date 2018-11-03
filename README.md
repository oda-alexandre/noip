# **<center>NoIP</center>**


**INTRODUCTION**

Syncronisation de noip a chaque demarrage


**INSTALLATION**

1 - Copier/Coller dans un terminal :

    apt update
    wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz -O ~/noip-duc-linux.tar.gz
    tar xf ~/noip-duc-linux.tar.gz -C /usr/local/src/

2 - Dans la fenetre qui vas s'ouvrir renseignez comme ceci :
(Si vous n'avez pas de compte NoIP suivez ce lien pour en creer un https://www.noip.com/sign-up)

* 1 - Entrez votre email noip
* 2 - Entrez votre mot de passe noip
* 3 - Entrez y et renseignez le temps entre chaque syncronisation (default 30min)
* 4 - Entrez y Appuyez sur entrer

3 - Copier/Coller dans un terminal :

    make install -C /usr/local/src/noip-*/
    git clone https://github.com/oda-alexandre/noip.git ~/noip
    mv -f ~/noip/noip /etc/init.d/
    chmod +x /etc/init.d/noip
    update-rc.d -f noip defaults
    echo "@reboot 	root 	service noip restart" >> /etc/crontab
    rm -rf ~/noip
    rm -rf ~/noip-duc-linux.tar.gz
    rm -rf /usr/local/src/noip-duc-linux.tar.gz
    service noip start
    noip2 -U 1


**CONFIGURATION**

Pour verifier le status vous pouvez copier/coller dans un terminal

    noip2 -S


**LICENSE**

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/noip/blob/master/LICENSE)
