

[![build](https://github.com/kollera/vcontrold-for-openwrt/actions/workflows/main.yml/badge.svg)](https://github.com/kollera/vcontrold-for-openwrt/actions/workflows/main.yml)


# Attention

This was tested for openwrt 24.10.2   

How to compile packages, see: 
[https://github.com/openwrt/docker](https://github.com/openwrt/docker)

```
docker run --rm -v "$(pwd)"/bin/:/builder/bin -it openwrt/sdk
# inside the Docker container
# set your required TARGET, e.g.
# 'export TARGET=bcm53xx/generic'
# 
cd /builder
./setup.sh
echo "src-git vcontrold https://github.com/womoak75/vcontrold-for-openwrt.git" >> feeds.conf.default
./scripts/feeds update -a
make defconfig
./scripts/feeds install libxml2
./scripts/feeds install vcontrold
make package/vcontrold/{clean,compile} -j$(nproc)
```
