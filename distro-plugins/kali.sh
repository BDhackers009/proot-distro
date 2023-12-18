DISTRO_NAME="Kali Linux (nethunter)"
TARBALL_URL['aarch64']="https://kali.download/nethunter-images/current/rootfs/kalifs-arm64-nano.tar.xz"
TARBALL_SHA256['aarch64']="44e70a16ddf3e94d5a27e209c8d643c556ec674d556fe8dc33fbd63bed220d71"
TARBALL_URL['arm']="https://kali.download/nethunter-images/current/rootfs/kalifs-armhf-nano.tar.xz"
TARBALL_SHA256['arm']="e9a32ff1d1baf50a5060a151821341c997abe4340bebcf8b18af31d1f41a3da3"
TARBALL_SHA256["x86_64"]="06dcc3e8c152ae9c28059b8472d947bf514ac14cd259930c42d33b9b5c1f511c"
TARBALL_URL["x86_64"]="https://kali.download/nethunter-images/current/rootfs/kalifs-amd64-minimal.tar.xz"
TARBALL_SHA256["i686"]="ce940e3977dbc4da1ce4f24123e8f59a11b1fdab4b5fe48b1c857ed43d905f91"
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
