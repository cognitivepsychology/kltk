#!/usr/bin/gawk -f 
#
# $ gawk -f list-ec-ec-ef.awk ec-ec-ef-sentences.list

BEGIN {
    FS = "\n";
    RS = "\n================\n";
    rmFS = "#####!#####";  # field separator for separating raw string and morph string
    wFS = " # "; # field separator for marking word boundary in morph string

    OFS = "\t";
}
{
    source_line = $1;
    emi_seq_line = $2;
    c1_line = $3;
    c2_line = $4;
    f_line = $5;

    split(source_line, temparr, rmFS);
    gid = temparr[1];
    sentence_raw = temparr[2];
    sentence_morph = temparr[3];

    split(emi_seq_line, temparr , rmFS);
    emi_seq_raw = temparr[1];
    emi_seq_morph = temparr[2];

    split(c1_line, temparr, rmFS);
    c1_raw = temparr[1];
    c1_morph = temparr[2];

    split(c2_line, temparr, rmFS);
    c2_raw = temparr[1];
    c2_morph = temparr[2];

    split(f_line, temparr, rmFS);
    f_raw = temparr[1];
    f_morph = temparr[2];

    split(emi_seq_morph, words, wFS);
    for (i=1; i<= length(words); ++i) {
	split(words[i], morphs, " ");
	j = length(morphs);
	if ( morphs[j] ~ /\/SF/) { emi[i] = morphs[--j]; }
	else { emi[i] = morphs[j]; }
	while ( morphs[j] !~ /\/(EC|EF)/) {
	    emi[i] = sprintf("%s %s", morphs[--j], emi[i]); 
	}
	#printf("%s # ", emi);
    }
    #print "";


    myeon = "^(으면|면)/EC$";
    aseo = "^(아서|어서)/EC$";      
    nikka = "^(으니까|니까)/EC$";
    myeonseo = "^(으면서|면서)/EC$";
    myeo = "^(으며|며)/EC$";
    neunde = "^(은데|ㄴ데|는데)/EC$";
    jiman = "^지만/EC$";
    ado = "^(아도|어도)/EC$";
    aya = "^(아야|어야)/EC$";
    daga = "^다가/EC$";

    test[0] = myeon;
    test[1] =     aseo;
    test[2] =     nikka;
    test[3] =     myeonseo;
    test[4] =     myeo;
    test[5] =     neunde;
    test[6] =     jiman;
    test[7] =     ado;
    test[8] =     aya;
    test[9] =     daga;
    

    for(i=0;i<=9;++i) {
	for(j=0;j<=9;++j) {
	    filename = sprintf("%d-%d.list", i, j);
	    if (emi[1] ~ test[i] && emi[2] ~ test[j]) {
   		print gid  >> filename;
   		print emi[1], c1_raw >>filename;
   		print emi[2], c2_raw >>filename;
   		print emi[3], f_raw >> filename;
   		print "================" >> filename;
		count[filename]++;
	    }
	}
    }


}
END {
    for(i=0;i<=9;i++) {
	for(j=0;j<=9;j++) {
	    printf("%d\t", count[i"-"j]);
	}
	print "";
    }
}
