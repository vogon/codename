apt-get -y install g\+\+ cmake llvm libconfig\+\+ git

git clone https://github.com/ldc-developers/ldc.git

cd ldc
git submodule update --init

git checkout release-0.12.1

rm -rf build
mkdir build && cd build
cmake ..
make -j4
make install

apt-get -y install gdb

apt-get -y install libzmq-dev
apt-get -y install liblua5.2-dev