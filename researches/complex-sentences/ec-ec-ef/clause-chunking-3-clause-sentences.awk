#!/usr/bin/gawk -f
# clause-chunking.awk
#
#
BEGIN{
	FS = "#####!#####";
}
{
	split($2, words, " ");
	split($3, arr, " # ");

	# initialize emi sequence
	clause_form = "";
	morph_form = "";
	clause_lines = "";
	emi_seq = "";
	verb_seq= "";
	word_count = 1;
	morph_count = 0;
	clause_count = 0;
	sentence_final_flag = 0;

	if ( $0 ~ /(ETM|ETN)/) {
		next;
	}

	for (i=1; i<=length(arr); i++){
	    split(arr[i], morphs, " ");
	    if ( clause_form == "" ) { clause_form = words[i] }
	    else { clause_form = sprintf("%s %s", clause_form, words[i]); }
	    if ( morph_form == "" ) { morph_form = arr[i]; }
	    else { morph_form = sprintf("%s %s", morph_form, arr[i]); }

	    if ( arr[i] ~ /\/EC/ ) {
		    # if EF is already encountered, goto next sentence
		    if ( sentence_final_flag) { next; }


		    if ( arr[i+1] !~ /\/VX/ && arr[i] !~ /\/(VA|XSA) 게\/EC/ ) {
			if ( emi_seq == "" ) { emi_seq = arr[i]; }
			else { emi_seq = sprintf("%s # %s", emi_seq, arr[i]);}
			if ( verb_seq == "" ) { verb_seq = words[i]; }
			else { verb_seq = sprintf("%s %s", verb_seq, words[i]);}


			#print_clause(clause_form, morph_form);
			if (clause_lines == "") { clause_lines = sprintf("%s#####!#####%s", clause_form, morph_form); }
			else { clause_lines = sprintf("%s\n%s#####!#####%s", clause_lines, clause_form, morph_form);}
			clause_form = "";
			morph_form = "";
		    }

	    } else if ( arr[i] ~ /\/EF/) {
			if ( emi_seq == "" ) { emi_seq = arr[i]; }
			else { emi_seq = sprintf("%s # %s", emi_seq, arr[i]);}
			if ( verb_seq == "" ) { verb_seq = words[i]; }
			else { verb_seq = sprintf("%s %s", verb_seq, words[i]);}

		    sentence_final_flag = 1;
		     #print_clause(clause_form, morph_form);
			if ( clause_lines == "" ) { clause_lines = sprintf("%s#####!#####%s", clause_form, morph_form); }
			else { clause_lines = sprintf("%s\n%s#####!#####%s", clause_lines, clause_form, morph_form);}
			clause_form = "";
			morph_form = "";



	    }
	}

	split(verb_seq, verb_arr, " ");
	if ( length(verb_arr) == 3 ) {
 	    print $0;
 	    #print "----------------"
 	    print verb_seq "#####!#####" emi_seq;
 	    #print "----------------"
 	    print clause_lines;
 	    print "================";
	}
}




function print_clause(clause_form, morph_form) {
	print clause_form "#####!#####" morph_form;
}
