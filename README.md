# NOIP

![noip](https://raw.githubusercontent.com/oda-alexandre/noip/master/img/logo-noip.png)


## INDEX

- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [Configuration](#CONFIGURATION)
- [License](#LICENSE)


## INTRODUCTION

Ce repository contient un script de syncronisation automatisé de l'IP public avec noip.


## PREREQUIS

Avoir un compte sur [Noip](https://www.noip.com/)


## INSTALLATION

* Installation de noip
```
wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz -O ~/noip-duc-linux.tar.gz
```
```
tar xf ~/noip-duc-linux.tar.gz -C /usr/local/src/
```
```
make install -C /usr/local/src/noip-*/
```

* Renseignez comme ceci :

1 - Entrez votre email noip
2 - Entrez votre mot de passe noip
3 - Entrez `y` et renseignez le temps entre chaque syncronisation (default 30min)
4 - Entrez `y` Appuyez sur entrer

* Téléchargement avec git
```
git clone https://github.com/oda-alexandre/noip.git ~/noip
```

* Déplacement du script dans le dossier /etc/init.d/
```
mv -f ~/noip/noip /etc/init.d/
```

* Rendre le script executable
```
chmod +x /etc/init.d/noip
```

* Démarrage automatique du script à chaque démarrage
```
update-rc.d -f noip defaults
```
```
echo "@reboot 	root 	service noip restart" >> /etc/crontab
```

* Suppression des résiduts d'installations
```
rm -rf ~/noip
```
```
rm -rf ~/noip-duc-linux.tar.gz
```
```
rm -rf /usr/local/src/noip-duc-linux.tar.gz
```

* Démarrage du service à chaque démarrage
```
service noip start
```

* Mise en place du temps de syncronisation vers noip sur une 1 minute
```
noip2 -U 1
```


## CONFIGURATION

Pour verifier le status vous pouvez copier/coller dans un terminal

```
noip2 -S
```


Pour modifier le temps de syncronisation vous pouvez copier/coller dans un terminal (remplacez le `1` par le temps en minute entre chaque syncronisation)

```
noip2 -U 1
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/noip/blob/master/LICENSE)
