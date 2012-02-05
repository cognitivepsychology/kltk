#!/usr/bin/gawk
{
	if ($0 ~ /\/EF .\/SF( .\/SS)?$/) {
		print $0;
	} else {
		#print $0;
	}
}

