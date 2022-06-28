library("ShortRead")

args = commandArgs(trailingOnly=TRUE)
sample = args[1] 
reads <- readFastq(paste0(sample,'.r2.fastq'))

headers=id(reads)
sequences=sread(reads)

barcodes=substr(sequences,1,8)
id=gsub(" .*","",headers)
id=paste0('@',id)

umi <- data.frame(cbind(id,barcodes))
write.table(umi, file=paste0(sample,"_umi.txt"), sep="\t", col.names = F, quote = F, row.names=F)

