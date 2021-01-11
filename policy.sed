#! /usr/bin/env -S sed -f
s#^\( *<policy domain="resource" name="disk" value="\).*\("/>\)$#\110GiB\1#
s#^\( *<policy domain="resource" name="memory" value="\).*\("/>\)$#\12GiB\1#

