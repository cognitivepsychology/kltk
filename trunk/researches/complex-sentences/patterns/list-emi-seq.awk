#!/usr/bin/gawk -f
# list-emi-seq.awk
#
# print list of emi sequences (see section 4.3.3)
#  - excludes "EC VX" sequences 

BEGIN{
	FS = "#####!#####";
}
{
	split($3, arr, " ");

	# initialize emi sequence
	emi_seq = "";

	for (i=1; i<=length(arr); i++){
		if ( arr[i] ~ /\/(EC|EF|ETM|ETN)/ ) {
			if ( i == length(arr)) {
				emi_seq = sprintf("%s %s", emi_seq, arr[i]);
			} else {
				if ( arr[i+1] !~ /\/VX/) {
					emi_seq = sprintf("%s %s", emi_seq, arr[i]);
				}
			}
		}
	}

	if (emi_seq != "") {
		printf("%s\t%s\n", $1, emi_seq);
	}
}
