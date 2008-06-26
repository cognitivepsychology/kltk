#!/usr/bin/gawk -f
#count-emi-seq-type-by-sentence-length.awk
#
# count number of emi sequence types
#       and number of emi pos sequence types 
#       by sentence length (i.e. number of clauses)
#
# @input: emi-pos-sequence-type-freq.tbl
#
# see section 4.3.4


BEGIN {
	FS = "\t";
	OFS = "\t";
	print "N", "pos", "emi", "emi/pos";
}
{
	if ( $1 == prev ) {
		num_emi_seq = num_emi_seq + $4;
		++num_pos_seq;
	} else {
		if ( prev != "") {
			printf("%s\t%d\t%d\t%3.2f\n", prev, num_pos_seq, num_emi_seq, num_emi_seq / num_pos_seq);
		}
		num_emi_seq = $4;
		num_pos_seq = 1;
	}

	prev = $1;
}



# == Output Sample ==
# N	pos	emi	emi/pos 
# 1	4	1554	388.50
# 2	18	11835	657.50
# 3	60	33242	554.03
# 4	164	58391	356.04
# 5	375	74388	198.37
# 6	736	63907	86.83
# 7	1310	49899	38.09
# 8	2142	32808	15.32
# 9	3105	21664	6.98
# 10	3871	14539	3.76
# 11	4164	9283	2.23
# 12	4055	6108	1.51
# 13	3445	4082	1.18
# 14	2547	2703	1.06
# 15	1726	1770	1.03
# 16	1233	1240	1.01
# 17	838	843	1.01
# 18	586	586	1.00
# 19	429	429	1.00
# 20	280	280	1.00
