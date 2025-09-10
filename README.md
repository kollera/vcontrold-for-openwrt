
[![bujld](https://github.com/kollera/vcontrold-for-openwrt/actions/workflows/main.yml/badge.svg)](https://github.com/kollera/vcontrold-for-openwrt/actions/workflows/main.yml)

# Attention

This was tested for [openwrt 24.10.2](https://openwrt.org/releases/24.10/notes-24.10.2)   

How to compile packages, see: 
[https://github.com/openwrt/docker](https://github.com/openwrt/docker)

There is a ongoing package manager switch from opkg to apk.   
Seems like the man/snaphost version of the sdk builder builds .apk packages by default,  
could'nt figure out how to configure for .ipk
   
the specific target sdk image (e.g. openwrt/sdk:mpc85xx-p1010-24.10.2) builds .ipk packages.  

# compile

<img width="1035" height="272" alt="target" src="https://github.com/user-attachments/assets/682faa15-9fb4-44a6-be82-0eaff078f314" />

target is ```mpc85x``` and subtarget is ```p1010```  
openwrt version: 24.10.2

required docker image is ```openwrt/sdk:mpc85xx-p1010-24.10.2```

```
docker run --rm -v "$(pwd)"/bin/:/builder/bin -it openwrt/sdk:mpc85xx-p1010-24.10.2
cd /builder
./setup.sh
echo "src-git vcontrold https://github.com/womoak75/vcontrold-for-openwrt.git" >> feeds.conf.default
./scripts/feeds update -a
make defconfig
./scripts/feeds install libxml2
./scripts/feeds install vcontrold
make package/vcontrold/compile -j1 V=sc
```
compiled package can be found in ```/builder/bin/packages/powerpc_8548/vcontrold```

```
buildbot@2a51b716c3b0:~$ ls bin/packages/powerpc_8548/vcontrold/*.ipk
vcontrold_0.98.12-r1_powerpc_8548.ipk
```


