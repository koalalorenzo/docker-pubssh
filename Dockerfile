from ubuntu:latest

ENV SSH_PASSPHRASE=""

RUN apt-get update
RUN apt-get upgrade --yes --force-yes
RUN apt-get install --yes --force-yes openssh-server openssh-client openssh-blacklist fail2ban

RUN mkdir -p ~/.ssh/
RUN ssh-keygen -t dsa -N "$SSH_PASSPHRASE" -C "Docker Key" -f ~/.ssh/id_rsa

RUN apt-get install --yes --force-yes python-dev python-pip

RUN pip install -U pip
RUN ln -s /usr/local/bin/pip /usr/bin/pip

CMD cat ~/.ssh/id_rsa.pub