#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
#rpm-ostree install screen

rpm -e kernel-core --allmatches --nodeps 
rpm -e kernel --nodeps --allmatches
rpm -e kernel-modules --nodeps --allmatches
rpm -e kernel-devel --nodeps --allmatches
rpm -e kernel-devel-matched --nodeps --allmatches
rpm -e kernel-headers --nodeps --allmatches
rpm -e kernel-modules-core --nodeps --allmatches
rpm -e kernel-modules-extra --nodeps --allmatches
rpm -e kernel-modules-internal --nodeps --allmatches
rpm -e kernel-uki-virt --nodeps --allmatches

cd /etc/yum.repos.d/
wget https://copr.fedorainfracloud.org/coprs/bieszczaders/kernel-cachyos/repo/fedora-$(rpm -E %fedora)/bieszczaders-kernel-cachyos-fedora-$(rpm -E %fedora).repo

sudo dnf install kernel-cachyos kernel-cachyos-devel-matched

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
