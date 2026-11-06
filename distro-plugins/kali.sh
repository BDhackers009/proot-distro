DISTRO_NAME="Kali Linux (nethunter)"
TARBALL_URL['aarch64']="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-nano-arm64.tar.xz"
TARBALL_SHA256['aarch64']="4fe2db857e2b3a7924e7e53059813c475fa461e0747de313f87272a049a08484"
TARBALL_URL['arm']="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-nano-armhf.tar.xz"
TARBALL_SHA256['arm']="d4e71533880119fb2a5d8ba98832b5c8c893ccc6865a1a6776ecf1ef494ba90a"
TARBALL_SHA256["x86_64"]="612e81433fe4adfaff96743ecdf6f0caea39a7e148808b5ededc34eca1c49c1a"
TARBALL_URL["x86_64"]="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-minimal-amd64.tar.xz"
TARBALL_SHA256["i686"]="13cbf6fbb7d3f37b843d95d810967f4af6087ee6ba303a3da429ee4f5cde8fb2"
TARBALL_URL["i686"]="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-minimal-i386.tar.xz"
distro_setup() {
	run_proot_cmd chsh -s /usr/bin/bash
	run_proot_cmd echo "$(getprop persist.sys.timezone)" > /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/etc/timezone
	#run_proot_cmd echo "if [ $(cat /etc/sudoers | grep $USER) = '' ]; then echo '${USER}	ALL=(ALL:ALL) ALL' >> /etc/sudoers;fi" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/home/${USER}/.bashrc
	#run_proot_cmd echo "if [ ! -f /root/.hushlogin ]; then clear && touch /root/.hushlogin && source /root/.bashrc && clear; fi" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/root/.bashrc
	run_proot_cmd rm -rf /usr/bin/kali-motd
	run_proot_cmd echo "deb https://kali.download/kali kali-rolling main contrib  non-free" > /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/etc/apt/sources.list
	#run_proot_cmd sed -i "s/8192/819/1" /usr/sbin/apache2ctl
}
