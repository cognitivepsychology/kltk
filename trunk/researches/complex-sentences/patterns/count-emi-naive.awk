#!/usr/bin/gawk -f
# count-emi-naive.awk
#
# count number of emi in a sentence (see section 4.2.2)
# 
BEGIN{
	FS = "#####!#####";
}
{
	split($3, arr, " ");

	c = 0
	for (i=1; i<=length(arr); i++){
		if ( arr[i] ~ /\/(EC|EF|ETM|ETN)/ ) {
					++c;
		}
	}
	print c;
}
