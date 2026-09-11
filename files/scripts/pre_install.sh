#!/usr/bin/env bash
set -eux -o pipefail

# remove unused repos
rm -vf /etc/yum.repos.d/{rpmfusion-*,_copr:*}.repo

# enable rpm fusion repos: https://rpmfusion.org/Configuration
dnf install -y \
	"https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
	"https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
dnf config-manager setopt fedora-cisco-openh264.enabled=1
dnf install -y 'rpmfusion-*-appstream-data'

# install rpm fusion multimedia packages: https://rpmfusion.org/Howto/Multimedia
dnf swap -y ffmpeg-free ffmpeg --allowerasing
dnf install -y @multimedia --setopt='install_weak_deps=False' --exclude='PackageKit-gstreamer-plugin'
dnf install -y intel-media-driver
dnf install -y mesa-va-drivers-freeworld
dnf swap -y mesa-vulkan-drivers{,-freeworld}
dnf install -y mesa-va-drivers-freeworld.i686
dnf swap -y mesa-vulkan-drivers{,-freeworld}.i686
dnf install -y rpmfusion-free-release-tainted
dnf install -y libdvdcss
dnf install -y rpmfusion-nonfree-release-tainted
dnf --repo='rpmfusion-nonfree-tainted' install -y '*-firmware'

# docker groups
groupadd -g 913 docker

# 1password groups: https://github.com/bsherman/ublue-custom/blob/main/build_files/1password.sh
groupadd -g 1790 onepassword
groupadd -g 1791 onepassword-cli
groupadd -g 1792 onepassword-mcp
