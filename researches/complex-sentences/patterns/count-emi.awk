#!/usr/bin/gawk -f
# count-emi.awk
#
# count number of emi in a sentence (sectio 4.2.2)
#  - does NOT count "EC VX" sequences
BEGIN{
	FS = "#####!#####";
}
{
	split($3, arr, " ");

	c = 0
	for (i=1; i<=length(arr); i++){
		if ( arr[i] ~ /\/(EC|EF|ETM|ETN)/ ) {
			if ( i == length(arr)) {
				++c;
			} else {
				if ( arr[i+1] !~ /\/VX/) {
					++c;
				}
			}
		}
	}
	print c;
}
