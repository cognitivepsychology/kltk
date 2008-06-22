


# SF + something type freqency table
# for section 4.2.1
SF-freq.tbl : sejong-sense.txt
	perl sf-type-list.pl sejong-sense.txt | sort | uniq -c | sort -nr > SF-freq.tbl

# list of sentences (horizontally aligned corpus)
# sentence gid, sentence form, morphologies
sejong-sense-sentence.txt : sejong-sense.txt
	~/kltk/scripts/corpus/sejong/sense/list.py h sejong-sense.txt > sejong-sense-sentence.txt

# list of normal sentences, which end with EF SF (SS)
sejong-sense-sentence-EF-SF.txt : sejong-sense-sentence.txt
	gawk -f select_EF-SF-SS.gawk sejong-sense-sentence.txt > sejong-sense-sentence-EF-SF.txt


