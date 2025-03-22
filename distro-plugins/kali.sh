DISTRO_NAME="Kali Linux (nethunter)"
TARBALL_URL['aarch64']="https://kali.download/nethunter-images/current/rootfs/https://kali.download/kali-nethunter-rootfs-nano-arm64.tar.xz"
TARBALL_SHA256['aarch64']="f3a36d7bdb70684cdda3150c40dd9d7ff11de92a60839137f3895278608833ff"
TARBALL_URL['arm']="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-armhf-nano.tar.xz"
TARBALL_SHA256['arm']="1aedc42b5a2d64064fc3916a973d15a176ed294b56d06c091da2247f11a5fb05"
TARBALL_SHA256["x86_64"]="248952f9c2302b02a875258912d9d16839b20cb527fa0184af0623f62e75c875"
TARBALL_URL["x86_64"]="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-amd64-minimal.tar.xz"
TARBALL_SHA256["i686"]="28291729a01d30a4bd02feb65c4365978a02e4752f936fb9dd26a1507652a429"
TARBALL_URL["i686"]="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-i386-minimal.tar.xz"
distro_setup() {
	run_proot_cmd chsh -s /usr/bin/bash
	run_proot_cmd echo "$(getprop persist.sys.timezone)" > /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/etc/timezone
	#run_proot_cmd echo "if [ $(cat /etc/sudoers | grep $USER) = '' ]; then echo '${USER}	ALL=(ALL:ALL) ALL' >> /etc/sudoers;fi" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/home/${USER}/.bashrc
	#run_proot_cmd echo "if [ ! -f /root/.hushlogin ]; then clear && touch /root/.hushlogin && source /root/.bashrc && clear; fi" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/root/.bashrc
	run_proot_cmd rm -rf /usr/bin/kali-motd
	run_proot_cmd echo "deb https://kali.download/kali kali-rolling main contrib  non-free" > /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/etc/apt/sources.list
	#run_proot_cmd sed -i "s/8192/819/1" /usr/sbin/apache2ctl
}
