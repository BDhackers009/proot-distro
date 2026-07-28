DISTRO_NAME="Kali Linux (nethunter)"
TARBALL_URL['aarch64']="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-nano-arm64.tar.xz"
TARBALL_SHA256['aarch64']="2ea1c50446b9b35506c4b1cc84a731c752892baafe0dc2a1332e460c2d2a1e4e"
TARBALL_URL['arm']="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-nano-armhf.tar.xz"
TARBALL_SHA256['arm']="4c9bcbdfc5fcadb12c563a2a4581c958ca7d5f51fb02698a1c7dbeb94865e543"
TARBALL_SHA256["x86_64"]="4c0847c6409be9b65c9fe3bb7a8a6af9d265ab56837323e2e319bb733f1ed86a"
TARBALL_URL["x86_64"]="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-minimal-amd64.tar.xz"
TARBALL_SHA256["i686"]="e2ea415531437e62af87bc896de93b767c7384cc7f794f547ba3fab064dd16b0"
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
