#!/usr/bin/env bash

set -ex

curl -sL https://deb.nodesource.com/setup_26.x | bash -

export DEBIAN_FRONTEND=noninteractive

apt-get -qq update
# Ubuntu 26.04 ships Python 3.14 as its system python3, so there is no deadsnakes PPA to add
apt-get -y install python3 python3-dev python3-venv
apt-get -y install gettext nodejs git make gcc
apt-get -y install pkg-config libcairo2-dev
apt-get -y install poppler-utils
apt-get -y install tzdata
apt-get -y autoremove

# apt-key no longer exists on Ubuntu 26.04, so yarn's apt repo can't be added, and Node 25+ no longer bundles corepack
npm install -g yarn

ln -sf /usr/bin/python3 /usr/bin/python

# Debian's system python is marked PEP 668 externally-managed, which makes pip refuse to install
# anything outside a venv. The deadsnakes 3.11 this image used to carry had no such marker. A CI
# container is the environment, so drop it rather than wrap every install in a venv.
rm -f /usr/lib/python3.*/EXTERNALLY-MANAGED

# wheel needs a newer packaging than the debian python3-packaging pulls in, and pip can't uninstall a
# debian package, so install pip alone
curl -s https://bootstrap.pypa.io/get-pip.py | python - --no-wheel

python -V
pip -V
pip install -U pip
pip -V
node -v
yarn -v
