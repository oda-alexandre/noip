FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com

ENV USER noip
ENV HOME /home/${USER}
ENV DEBIAN_FRONTEND noninteractive

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m' && \
apt-get update && apt-get install --no-install-recommends -y \
ca-certificates \
make \
gcc \
sudo \
wget

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m' && \
useradd -d ${HOME} -m ${USER} && \
passwd -d ${USER} && \
adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR ${HOME}

RUN echo -e '\033[36;1m ******* INSTALL APP ******** \033[0m' && \
wget http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz -O ${HOME}/noip-duc-linux.tar.gz && \
sudo tar xf ${HOME}/noip-duc-linux.tar.gz -C /usr/local/ && \
sudo make install -C /usr/local/noip-*/

RUN echo -e '\033[36;1m ******* ADD INIT SCRIPT ******** \033[0m'
COPY ./noip ${HOME}/noip

RUN echo -e '\033[36;1m ******* INSTALL INIT SCRIPT ******** \033[0m' && \
sudo mv -f ${HOME}/noip/noip /etc/init.d/ && \
sudo chmod +x /etc/init.d/noip && \
sudo update-rc.d -f noip defaults && \
echo "@reboot     root     service noip restart" | sudo tee -a /etc/crontab && \
rm -rf ${HOME}/noip && \
rm -rf ${HOME}/noip-duc-linux.tar.gz && \
rm -rf /usr/local/noip-duc-linux.tar.gz && \
sudo service noip start && \
sudo noip2 -U 1

RUN echo -e '\033[36;1m ******* CLEANING ******** \033[0m' && \
sudo apt-get --purge autoremove -y \
sudo apt-get autoclean -y && \
sudo rm /etc/apt/sources.list && \
sudo rm -rf /var/cache/apt/archives/* && \
sudo rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD /bin/bash \