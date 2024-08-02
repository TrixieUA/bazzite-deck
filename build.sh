#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Enable copr repo
curl -Lo /etc/yum.repos.d/trixieua-deck.repo https://copr.fedorainfracloud.org/coprs/trixieua/deck/repo/fedora-$(rpm -E %fedora)/trixieua-deck-fedora-$(rpm -E %fedora).repo?arch=x86_64 && \
curl -Lo /etc/yum.repos.d/g3tchoo-prismlauncher.repo https://copr.fedorainfracloud.org/coprs/g3tchoo/prismlauncher/repo/fedora-$(rpm -E %fedora)/g3tchoo-prismlauncher-fedora-$(rpm -E %fedora).repo && \
curl -Lo /etc/yum.repos.d/klassy.repo https://download.opensuse.org/repositories/home:paul4us/Fedora_$(rpm -E %fedora)/home:paul4us.repo && \
curl -Lo /etc/yum.repos.d/peterwu-rendezvous.repo https://copr.fedorainfracloud.org/coprs/peterwu/rendezvous/repo/fedora-$(rpm -E %fedora)/peterwu-rendezvous-fedora-40.repo && \
curl -Lo /etc/yum.repos.d/trixieua-materia-kde6.repo https://copr.fedorainfracloud.org/coprs/trixieua/materia-kde6/repo/fedora-$(rpm -E %fedora)/trixieua-materia-kde6-fedora-40.repo && \
# Replace packages
rpm-ostree override replace \
  --experimental \
  --from repo=copr:copr.fedorainfracloud.org:trixieua:deck \
  mesa-filesystem \
  mesa-libglapi \
  mesa-dri-drivers \
  mesa-libgbm \
  mesa-libEGL \
  mesa-libEGL-devel \
  mesa-libGL \
  mesa-libOSMesa \
  mesa-vulkan-drivers \
  mesa-libxatracker \
  mesa-vdpau-drivers-freeworld \
  mesa-va-drivers-freeworld &&
  rpm-ostree override remove gamescope-libs.i686
