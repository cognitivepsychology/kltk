# draw graph emi sequence type frequency by sentence length
# section 4.3.4
library(cairoDevice)
Cairo_pdf("emi-seq-type-freq-by-sentence-length.pdf",height=7,width=10,pointsize=7)
emiseqtype = read.table("emi-seq-type-freq-by-sentence-length.tbl", header=TRUE)
plot(emiseqtype[1:50,1], emiseqtype[1:50,3],type="b",xlab="절의 개수",log="y",ylab="",pch=20)
points(emiseqtype[1:50,1], emiseqtype[1:50,2],type="b",pch=0)
points(emiseqtype[1:50,1], emiseqtype[1:50,4],type="b",pch=8)
legend("topright", c("emi", "pos", "emi/pos"), pch=c(20,0,8))
