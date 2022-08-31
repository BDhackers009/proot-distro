DISTRO_NAME="Kali Linux (nethunter)"
TARBALL_URL['aarch64']="https://kali.download/nethunter-images/current/rootfs/kalifs-arm64-nano.tar.xz"
TARBALL_SHA256['aarch64']="be846f12da06c59da520860dc9da18ecacffca19c4723ffa4e148fa8ba3918c7"
TARBALL_URL['arm']="https://kali.download/nethunter-images/current/rootfs/kalifs-armhf-nano.tar.xz"
TARBALL_SHA256['arm']="2d78e25ab2aa6b052e097a190b104feaaeb3e6520dd5a6f0ebda87a9e36ae869"
distro_setup() {
	run_proot_cmd userdel -rf kali
	run_proot_cmd echo "if [ ! -f /root/.hushlogin ]; then clear && touch /root/.hushlogin && source /root/.zshrc && clear; fi" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/root/.zshrc
	run_proot_cmd echo "deb https://kali.download/kali kali-rolling main contrib  non-free" > /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/etc/apt/sources.list
	run_proot_cmd sed -i "s/8192/819/1" /usr/sbin/apache2ctl
}

