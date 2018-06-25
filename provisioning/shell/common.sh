#!/bin/bash
#
export LANG=en_US.UTF-8

# quick and dumb way to make system updates based on distro
set +e
which apt >/dev/null 2>&1
result=$?
set -e
if [ $result -eq 0 ]; then
	export DEBIAN_FRONTEND=noninteractive

	apt-get update
	apt-get install -y \
		python \
		rsync
fi

set +e
which yum >/dev/null 2>&1
result=$?
set -e
if [ $result -eq 0 ]; then
	yum install -y \
		python2 \
		rsync

fi
