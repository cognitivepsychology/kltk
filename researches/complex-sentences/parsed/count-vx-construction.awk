#!/usr/bin/gawk -f
# count-vx-construction.awk
#
# @input sejong-parsed-sentences.list
#
{
	for(i=1;i<=NF;++i) {
		if ( $i ~ /\/VX/) {
			if ( $(i-1) ~ /\/EC/) {
				print $(i-1), $i;
			} else {
				print $(i-2), $(i-1), $i;
			}
		}
	}
}
