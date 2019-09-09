# NOIP

<img src="https://raw.githubusercontent.com/oda-alexandre/noip/master/img/logo-noip.png" width="200" height="200"/>

## INDEX

- [Introduction](#INTRODUCTION)
- [Prerequisites](#PREREQUISITESITES)
- [Install](#INSTALL)
- [Configuration](#CONFIG)
- [License](#LICENSE)

## INTRODUCTION

This repository contains an init script to sync auto of IP public with noip.

## PREREQUISITES

Account [Noip](https://www.noip.com/)

## INSTALL

- Install of noip

```wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz -O ~/noip-duc-linux.tar.gz```

```tar xf ~/noip-duc-linux.tar.gz -C /usr/local/src/```

```make install -C /usr/local/src/noip-*/```

- Fill in like this :

1 - Enter your email noip
2 - Enter your password noip
3 - Enter `y` and fill in the time between each sync (default 30min)
4 - Enter `y` Push enter

- Download with git

```git clone https://gitlab.com/oda-alexandre/noip.git ~/noip```

- Moving the script in the folder /etc/init.d/

```mv -f ~/noip/noip /etc/init.d/```

- Make the script executable

```chmod +x /etc/init.d/noip```

- Automatic startup of the script

```update-rc.d -f noip defaults```

```echo "@reboot     root     service noip restart" >> /etc/crontab```

- Removal of the install residues

```rm -rf ~/noip```

```rm -rf ~/noip-duc-linux.tar.gz```

```rm -rf /usr/local/src/noip-duc-linux.tar.gz```

- start-up of service at boot

```service noip start```

- Set up of time of sync to noip on 1 minute

```noip2 -U 1```

## CONFIG

To check the status you can copy / paste in a terminal

```noip2 -S```

To change the time of sync you can copy / paste in a terminal (replace the `1` by the time in minute between each sync)

```noip2 -U 1```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/noip/blob/master/LICENSE)
