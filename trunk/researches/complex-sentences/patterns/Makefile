



# for section 4.4.2
#

fig4-1.pdf : n-emi-no-vx-sentence-EF-SF-freq.tbl n-emi-no-vx-sentence-freq.tbl n-emi-sentence-freq.tbl
	R CMD BATCH n-clause-graph.r

n-emi-no-vx-sentence-EF-SF-freq.tbl :  ../sejong-sense-sentence-EF-SF.txt
	gawk -f count-emi.gawk ../sejong-sense-sentence-EF-SF.txt | sort | uniq -c | sort -k2 -n >  n-emi-no-vx-sentence-EF-SF-freq.tbl

n-emi-no-vx-sentence-freq.tbl :  ../sejong-sense-sentence.txt
	gawk -f count-emi.gawk ../sejong-sense-sentence.txt | sort | uniq -c | sort -k2 -n > n-emi-no-vx-sentence-freq.tbl

n-emi-sentence-freq.tbl :  ../sejong-sense-sentence.txt
	gawk -f count-emi-naive.gawk ../sejong-sense-sentence.txt | sort | uniq -c | sort -k2 -n > n-emi-sentence-freq.tbl


