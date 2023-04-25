# winewrap

## Build AppImage

Run `docker-compose run --rm appimage` in one of the `appimages/` directories.

## Setup FEX-Emu

Run `./bin/InstallFEX` to install FEX-Emu on an Ubuntu ARM64 system. Only do this
on ARM64.

### Fetch RootFS

```
ubuntu@ubuntu:~/.fex-emu/RootFS$ FEXRootFSFetcher
RootFS not found. Do you want to try and download one?
Response {y,yes,1} or {n,no,0}
y
Found exact match for distro 'Ubuntu 20.04 (SquashFS)'. Do you want to select this image?
Response {y,yes,1} or {n,no,0}
y
Selected Rootfs: Ubuntu 20.04 (SquashFS)
	URL: https://rootfs.fex-emu.com/file/fex-rootfs/Ubuntu_20_04/2022-12-04/Ubuntu_20_04.sqsh
Are you sure that you want to download this image
Response {y,yes,1} or {n,no,0}
y
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  797M  100  797M    0     0  23.7M      0  0:00:33  0:00:33 --:--:-- 28.3M
Do you wish to extract the squashfs file or use it as-is?
Options:
	0: Cancel
	1: Extract
	2: As-Is
	
Response {1-2} or 0 to cancel
1
Parallel unsquashfs: Using 8 processors
52846 inodes (70188 blocks) to write

[=====================================================================\] 70188/70188 100%

created 42031 files
created 5178 directories
created 10598 symlinks
created 0 devices
created 0 fifos
Do you wish to set this RootFS as default?
Response {y,yes,1} or {n,no,0}
y
Ubuntu_20_04 set as default RootFS
```

### Updating RootFS packages

```
ubuntu@ubuntu:~/.fex-emu/RootFS/Ubuntu_20_04$ ./unbreak_chroot.sh 
Moving rootfs files back to original location
Moving rootfs folders back to original location
Moving rootfs apt folders back to original location
Changing rootfs permissions on /tmp
Mounting rootfs paths
Mounting aarch64 paths
Starting FEXServer
chmod: cannot access '/tmp/1000-Ubuntu_20_04.chroot': No such file or directory
Chrooting into container
root@ubuntu:/# CONF=/etc/apt/apt.conf.d/99-insecure
root@ubuntu:/# echo "APT::Get::AllowUnauthenticated \"true\";" >> "${CONF}"
root@ubuntu:/# echo "Acquire::AllowInsecureRepositories \"true\";" >> "${CONF}"
root@ubuntu:/# apt update && apt upgrade -y
```
