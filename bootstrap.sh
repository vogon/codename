# set up D APT
wget http://netcologne.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
apt-get update
apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring
apt-get update

apt-get -y install dmd-bin dub gdb

apt-get -y install libzmq-dev
apt-get -y install liblua5.2-dev