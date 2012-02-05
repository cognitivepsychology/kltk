#!/usr/bin/gawk -f
# make-freq-emi-pos-seq-type.awk
#
# make frequency table of emi pos tag sequence types (see section 4.3.4)
#


BEGIN {
	OFS = "\t";
}
{
	freq = $1;
	emi_pos_seq = "";
	for (i=2;i<=NF;++i) {
		split($i, temparr, "/");
		if (emi_pos_seq == "") {
			emi_pos_seq = temparr[2];
		} else {
			emi_pos_seq = sprintf("%s %s", emi_pos_seq, temparr[2]);
		}
	}
	token_freq[emi_pos_seq] = token_freq[emi_pos_seq] + freq;
	++type_freq[emi_pos_seq];
	emi_pos_len[emi_pos_seq] = NF - 1;
}
END {
	for (e in token_freq) {
		print emi_pos_len[e], e, token_freq[e], type_freq[e];	
	}
}

