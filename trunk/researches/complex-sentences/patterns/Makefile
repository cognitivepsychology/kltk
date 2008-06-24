



# for section 4.4.2
#

fig4-1.pdf : n-emi-no-vx-sentence-EF-SF-freq.tbl n-emi-no-vx-sentence-freq.tbl n-emi-sentence-freq.tbl
	R CMD BATCH n-clause-graph.r

n-emi-no-vx-sentence-EF-SF-freq.tbl :  ../sejong-sense-sentence-EF-SF.txt
	gawk -f count-emi.awk ../sejong-sense-sentence-EF-SF.txt | sort | uniq -c | sort -k2 -n >  n-emi-no-vx-sentence-EF-SF-freq.tbl

n-emi-no-vx-sentence-freq.tbl :  ../sejong-sense-sentence.txt
	gawk -f count-emi.awk ../sejong-sense-sentence.txt | sort | uniq -c | sort -k2 -n > n-emi-no-vx-sentence-freq.tbl

n-emi-sentence-freq.tbl :  ../sejong-sense-sentence.txt
	gawk -f count-emi-naive.awk ../sejong-sense-sentence.txt | sort | uniq -c | sort -k2 -n > n-emi-sentence-freq.tbl


# for section 4.3.3
emi-sequences.list : ../sejong-sense-sentence.txt
	gawk -f list-emi-seq.awk ../sejong-sense-sentence.txt > emi-sequences.list

emi-sequence-type-freq.tbl : emi-sequences.list
	cut -f2 emi-sequences.list | sort | uniq -c | sort -nr > emi-sequence-type-freq.tbl
