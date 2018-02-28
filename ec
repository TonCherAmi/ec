#!/usr/bin/env sh
#
# Copyright © 2018 Vasili Karaev
# 
# This file is part of ec.
#
# ec is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ec is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with ec.  If not, see <http://www.gnu.org/licenses/>.

version="0.1"
progname="$(basename $0)"

config="$HOME/.config/ec/config"

usage() {
	echo "\
Usage: $progname [-vhl] <config>"
}

version() {
	echo "$progname: version $version"
}

die() {
	echo "$progname: $@" >&2
	exit 1
}

list() {
	echo "$(cat "$config" | grep '^\w\+=.\+$' | sed 's/=.\+//g')"
}

edit() {
	source "$config"

	eval file='$'$1

	if [ -z "$file" ]; then
		die "no such config $1"
	fi

	"$EDITOR" "$file"
}

subcommand="$1"

case "$subcommand" in
	-h|'')
		usage
		;;
	-v)
		version
		;;
	-l)
		list
		;;
	*)
		edit "$@"
		;;
esac
