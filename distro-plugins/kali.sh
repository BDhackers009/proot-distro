DISTRO_NAME="Kali Linux (nethunter)"
TARBALL_URL['aarch64']="https://github.com/BDhackers009/nethunter-termux/releases/download/v2022.8-nh/kalifs-arm64-nano.tar.xz"
TARBALL_SHA256['aarch64']="451a8f44bdceb7966d09cf158e81bbe509979641478c8f95acb780eb7f483a9c"
TARBALL_URL['arm']="https://github.com/BDhackers009/nethunter-termux/releases/download/v2022.8-nh/kalifs-armhf-nano.tar.xz"
TARBALL_SHA256['arm']="2d78e25ab2aa6b052e097a190b104feaaeb3e6520dd5a6f0ebda87a9e36ae869"
TARBALL_SHA256["x86_64"]="d54e862929c69f247a453a78fe4f60c6d963af5c2b78c42b7c831f2bbe54a510"
TARBALL_URL["x86_64"]="https://github.com/BDhackers009/nethunter-termux/releases/download/v2022.8-nh/kalifs-amd64-minimal.tar.xz"
TARBALL_SHA256["i686"]="62b3da1bfe9e36249d4ada485ec84ed3e1b7fe9b86deb0bb257622a6bd03545e"
TARBALL_URL["i686"]="https://github.com/BDhackers009/nethunter-termux/releases/download/v2022.8-nh/kalifs-i386-minimal.tar.xz"
distro_setup() {
	run_proot_cmd userdel -rf kali
	run_proot_cmd echo ".hushlogin" >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/root/
	run_proot_cmd echo "deb https://kali.download/kali kali-rolling main contrib  non-free" > /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/kali/etc/apt/sources.list
	run_proot_cmd sed -i "s/8192/819/1" /usr/sbin/apache2ctl
}

