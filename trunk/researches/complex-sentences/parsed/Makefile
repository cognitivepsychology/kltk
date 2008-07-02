
sejong-parsed-sentences.list : sejong-parsed.dep
	python ~/kltk/scripts/corpus/sejong/parsed/list-sentences.py sejong-parsed.dep > sejong-parsed-sentences.list

vx-construction-freq.tbl : sejong-parsed-sentences.list count-vx-construction.awk
	gawk -f count-vx-construction.awk sejong-parsed-sentences.list | sort | uniq -c | sort -nr > vx-construction-freq.tbl

ec-pairs.list : sejong-parsed.dep extract-emi-pair.py
	python extract-ec-pair.py sejong-parsed.dep > ec-pairs.list
