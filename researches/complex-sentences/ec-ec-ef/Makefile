





E3SL := ec-ec-ef-sentences.list # Emi 3 Sentence List
SSSC := ../sejong-sense-sentence-wb-EF-SF.txt # Sejong Sense Sentence Corpus




#
# make 3-clause sentence list
#
$(E3SL) : clause-chunking-3-clause-sentences.awk $(SSSC)
	gawk -f clause-chunking-3-clause-sentences.awk $(SSSC) > $(E3SL)

#
# make EC1-EC2 pair data
#
extract : $(E3SL) list-ec-ec-ef.awk
	gawk -f list-ec-ec-ef.awk $(E3SL)


