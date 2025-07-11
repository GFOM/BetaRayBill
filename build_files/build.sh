#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install @cosmic-desktop-environment tio btop fastfetch hyfetch adb -y 
dnf5 remove rhythmbox nheko ibus okular thunderbird -y
# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
dnf5 config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo -y
dnf5 install mullvad-browser -y

#### Example for enabling a System Unit File

systemctl enable podman.socket

