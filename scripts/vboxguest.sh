#!/usr/bin/env bash
set -o errexit
set -o nounset
aptitude install -y virtualbox-guest-dkms
echo -e "vboxguest\nvboxsf\nvboxvideo" >> /etc/modules
exit $?
