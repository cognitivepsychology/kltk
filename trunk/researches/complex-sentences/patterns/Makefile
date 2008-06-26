

#
# == section 4.4.2
#

# R Graphics
fig4-1.pdf : n-emi-no-vx-sentence-EF-SF-freq.tbl n-emi-no-vx-sentence-freq.tbl n-emi-sentence-freq.tbl
	R CMD BATCH n-clause-graph.r

# table : EF SF (SS) sentences
# count all emi, except "EC VX"
n-emi-no-vx-sentence-EF-SF-freq.tbl :  ../sejong-sense-sentence-EF-SF.txt
	gawk -f count-emi.awk ../sejong-sense-sentence-EF-SF.txt | sort | uniq -c | sort -k2 -n >  n-emi-no-vx-sentence-EF-SF-freq.tbl

# table : all sentences, including fragments
# count all emi, except "EC VX"
n-emi-no-vx-sentence-freq.tbl :  ../sejong-sense-sentence.txt
	gawk -f count-emi.awk ../sejong-sense-sentence.txt | sort | uniq -c | sort -k2 -n > n-emi-no-vx-sentence-freq.tbl

# table : all sentences, including fragments
# count all emi
n-emi-sentence-freq.tbl :  ../sejong-sense-sentence.txt
	gawk -f count-emi-naive.awk ../sejong-sense-sentence.txt | sort | uniq -c | sort -k2 -n > n-emi-sentence-freq.tbl


#
# == section 4.3.3
#
emi-sequences.list : ../sejong-sense-sentence.txt
	gawk -f list-emi-seq.awk ../sejong-sense-sentence.txt > emi-sequences.list

emi-sequence-type-freq.tbl : emi-sequences.list
	cut -f2 emi-sequences.list | sort | uniq -c | sort -nr > emi-sequence-type-freq.tbl

#
# msort options:
# -l : a record is one line
# -d"\t" : delimiter is TAB
# -n 1 -c n : field 1 numeric
# -n 3 -c n -i : field 2 numeric inverse
#
emi-pos-sequence-type-freq.tbl : emi-sequence-type-freq.tbl
	gawk -f make-freq-emi-pos-seq-type.awk emi-sequence-type-freq.tbl | msort -l -d"\t" -n 1 -c n -n 3 -c n -i > emi-pos-sequence-type-freq.tbl


#
# == section 4.3.4 emi sequence type frequency by sentence length
#
# table
emi-seq-type-freq-by-sentence-length.tbl : count-emi-seq-type-by-sentence-length.awk emi-pos-sequence-type-freq.tbl 
	gawk -f count-emi-seq-type-by-sentence-length.awk emi-pos-sequence-type-freq.tbl > emi-seq-type-freq-by-sentence-length.tbl 

# R graphics
emi-seq-type-freq-by-sentence-length.pdf : emi-seq-type-freq-by-sentence-length.r emi-seq-type-freq-by-sentence-length.tbl
	R CMD BATCH emi-seq-type-freq-by-sentence-length.r

emi-seq-type-freq-by-sentence-length.eps : emi-seq-type-freq-by-sentence-length.pdf
	pdftops emi-seq-type-freq-by-sentence-length.pdf
	ps2eps -f emi-seq-type-freq-by-sentence-length.ps
	rm emi-seq-type-freq-by-sentence-length.ps



