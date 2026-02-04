DISTRO_NAME="Kali Linux (nethunter)"
TARBALL_URL['aarch64']="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-nano-arm64.tar.xz"
TARBALL_SHA256['aarch64']="73134c64ca91a562fd2dc4be428633001c92d8d48be59ef4cbfaa73d358986a1"
TARBALL_URL['arm']="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-armhf-nano.tar.xz"
TARBALL_SHA256['arm']="9157cc56a210da83df397878704539d95ec25209a23363e3dac9e579be9b4caa"
TARBALL_SHA256["x86_64"]="98164335544a6416e008a6039b12aea4daa6f99741ce099e00267cb8f1989f37"
TARBALL_URL["x86_64"]="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-amd64-minimal.tar.xz"
TARBALL_SHA256["i686"]="ca30f258358c83152ff27ac138b65e5ece28dd6aa1170f0ba939f94d75fb9d06"
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
