#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Enable copr repo
curl -Lo /etc/yum.repos.d/trixieua-deck.repo https://copr.fedorainfracloud.org/coprs/trixieua/deck/repo/fedora-$(rpm -E %fedora)/trixieua-deck-fedora-$(rpm -E %fedora).repo?arch=x86_64 && \

# Replace packages
rpm-ostree override replace \
  --experimental \
  --from repo=copr:copr.fedorainfracloud.org:trixieua:deck \
  gamescope \
  gamescope-libs \
  xorg-x11-server-Xwayland \
  wlroots \
  mesa-filesystem \
  mesa-libglapi \
  mesa-dri-drivers \
  mesa-libgbm \
  mesa-libEGL \
  mesa-libGL \
  mesa-vulkan-drivers \
  mesa-libxatracker \
  mesa-libGLU \
  mesa-libOSMesa \
  mesa-vdpau-drivers-freeworld \
  mesa-va-drivers-freeworld