DISTRO_NAME="Kali Linux (nethunter)"
TARBALL_URL['aarch64']="https://kali.download/nethunter-images/current/rootfs/kalifs-arm64-nano.tar.xz"
TARBALL_SHA256['aarch64']="04a12b79d4ac38b7c85ea3eb25a85bff07fb89505a889782a114a97a5de2a84b"
TARBALL_URL['arm']="https://kali.download/nethunter-images/current/rootfs/kalifs-armhf-nano.tar.xz"
TARBALL_SHA256['arm']="17bae20743c67017d83448bc82de7cedaeb354d1c75dbadf2357fe93cf769f84"
TARBALL_SHA256["x86_64"]="b7cfeccdcbf7a2844245405ecc680432237d3b0da49ee35eab0f3ce9fab645a1"
TARBALL_URL["x86_64"]="https://kali.download/nethunter-images/current/rootfs/kalifs-amd64-minimal.tar.xz"
TARBALL_SHA256["i686"]="0dd4b95635b601b9516c29bee016363dd5f378f9abb104736f93f76c82c3d8b6"
TARBALL_URL["i686"]="https://kali.download/nethunter-images/current/rootfs/kalifs-i386-minimal.tar.xz"
distro_setup() {
	run_proot_cmd chsh -s /usr/bin/bash
	run_proot_cmd echo "$(getprop persist.sys.timezone)" > /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/etc/timezone
	#run_proot_cmd echo "if [ $(cat /etc/sudoers | grep $USER) = '' ]; then echo '${USER}	ALL=(ALL:ALL) ALL' >> /etc/sudoers;fi" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/home/${USER}/.bashrc
	#run_proot_cmd echo "if [ ! -f /root/.hushlogin ]; then clear && touch /root/.hushlogin && source /root/.bashrc && clear; fi" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/root/.bashrc
	run_proot_cmd rm -rf /usr/bin/kali-motd
	run_proot_cmd echo "deb https://kali.download/kali kali-rolling main contrib  non-free" > /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/etc/apt/sources.list
	#run_proot_cmd sed -i "s/8192/819/1" /usr/sbin/apache2ctl
}
