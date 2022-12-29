DISTRO_NAME="Kali Linux (nethunter)"
TARBALL_URL['aarch64']="https://github.com/BDhackers009/nethunter-termux/releases/download/v2022.12-nh/kalifs-arm64-minimal.tar.xz"
TARBALL_SHA256['aarch64']="149e56700374920a25016e228b93d0ce2aa9eccfe76a06436e48697dc70dd342"
TARBALL_URL['arm']="https://github.com/BDhackers009/nethunter-termux/releases/download/v2022.12-nh/kalifs-armhf-minimal.tar.xz"
TARBALL_SHA256['arm']="e9117e6464a98e76e19793d44b6f84c836b1781ba6e01125f5292708be9232a0"
TARBALL_SHA256["x86_64"]="e6b239d709f6e39d468404961a2c241a69ac866ebe49b5dc8cdec4a2be585912"
TARBALL_URL["x86_64"]="https://github.com/BDhackers009/nethunter-termux/releases/download/v2022.12-nh/kalifs-amd64-minimal.tar.xz"
TARBALL_SHA256["i686"]="6ec934ac10e100b84b5f635afa55a869fdc0c537a5b27e448650415c03b65c1a"
TARBALL_URL["i686"]="https://github.com/BDhackers009/nethunter-termux/releases/download/v2022.12-nh/kalifs-i386-minimal.tar.xz"
distro_setup() {
	run_proot_cmd chsh -s /usr/bin/bash
	#run_proot_cmd echo "if [ $(cat /etc/sudoers | grep $USER) = '' ]; then echo '${USER}	ALL=(ALL:ALL) ALL' >> /etc/sudoers;fi" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/home/${USER}/.bashrc
	#run_proot_cmd echo "if [ ! -f /root/.hushlogin ]; then clear && touch /root/.hushlogin && source /root/.bashrc && clear; fi" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/root/.bashrc
	run_proot_cmd rm -rf /usr/bin/kali-motd
	run_proot_cmd echo "deb https://kali.download/kali kali-rolling main contrib  non-free" > /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/etc/apt/sources.list
	#run_proot_cmd sed -i "s/8192/819/1" /usr/sbin/apache2ctl
}

