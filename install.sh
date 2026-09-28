#!/usr/bin/env bash

set -ex

curl -sL https://deb.nodesource.com/setup_26.x | bash -

export DEBIAN_FRONTEND=noninteractive

apt-get -y install software-properties-common
add-apt-repository -y ppa:deadsnakes/ppa
apt-get -qq update
apt-get -y install python3.11 python3.11-dev python3.11-venv python3.11-distutils
apt-get -y install gettext nodejs git make gcc
apt-get -y install pkg-config libcairo2-dev
apt-get -y install poppler-utils
apt-get -y install tzdata
apt-get -y autoremove

# apt-key no longer exists on Ubuntu 26.04, so yarn's apt repo can't be added, and Node 25+ no longer bundles corepack
npm install -g yarn

ln -sf /usr/bin/python3.11 /usr/bin/python3
ln -sf /usr/bin/python3.11 /usr/bin/python

# wheel needs a newer packaging than the debian python3-packaging software-properties-common pulls in, and pip can't
# uninstall a debian package, so install pip alone
curl -s https://bootstrap.pypa.io/get-pip.py | python - --no-wheel

python -V
pip -V
pip install -U pip
pip -V
node -v
yarn -v
