#!/bin/bash
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
#
#    Copyright (C) 2010 - 2012  Karl Goetz
#
# -----------------------------------------------------------------------------

cd `dirname $0`/..
. config

# Manually uncomment this line after looking at what the script does.
exit 1

# Remove the package database(s)
rm $REPODST/db/references.db
rm $REPODST/db/packages.db

# Remove the dists files
rm -r $REPODST/dists

for component in $COMPONENTS; do
        find $REPODST/pool/$component -name *.deb -exec reprepro -Vb $REPODST --component $component includedeb deltah {} \;
        find $REPODST/pool/$component -name *.udeb -exec reprepro -Vb $REPODST --component $component includeudeb deltah {} \;
        find $REPODST/pool/$component -name *.dsc -exec reprepro -Vb $REPODST --component $component includedsc deltah {} \;
done

