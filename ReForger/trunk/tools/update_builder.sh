#!/bin/sh
# -----------------------------------------------------------------------------
#    Part of the ReForger scripts - Fork a Debian
#    Copyright (C) 2012-2013  hyperclock (aka JMColeman & the SharkOS project.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
# -----------------------------------------------------------------------------
#
# ------------------------------- Attribution ---------------------------------
# -----------------------------------------------------------------------------


# Update Builder and packages from the Bazaar repo.

LOCKFILE="/srv/logs/update_gnewsense.lock"

if [ -f $LOCKFILE ]; then
	exit
fi

touch $LOCKFILE
cd /srv/builder/
bzr pull

MRCONFIG="gnewsense.mrconfig"
cd packages
mr -c $MRCONFIG -q -j 2 checkout
mr -c $MRCONFIG -q -j 2 update

rm $LOCKFILE
