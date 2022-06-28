library(GUIDEseq)
library(BSgenome.Hsapiens.UCSC.hg38)

args = commandArgs(trailingOnly=TRUE)

umifile <- args[1]
bamfile <- args[2] 
gRNAs <- "gRNA.fa"

name <- args[3]
outputDir <-  paste0(name,"_guideseq_out")
dir.create(outputDir)

GUIDEseqAnalysis(alignment.inputfile = bamfile , umi.inputfile = umifile,
                        alignment.format = c("bam"),
                        BSgenomeName = Hsapiens,
                        gRNA.file = gRNAs, n.cores.max = 4,min.mapping.quality = 15,max.R1.len = 150, max.R2.len =150,
                        min.reads = 2,min.SNratio = 2, maxP = 0.01,window.size = 25,step = 25,
                        plus.strand.start.gt.minus.strand.end = FALSE,distance.threshold = 1000,
                        upstream = 50, downstream =50, PAM.size = 3, gRNA.size = 20,
                        PAM = "NGG", PAM.pattern = "(NGG)$", max.mismatch = 6,
                        outputDir = outputDir,
                        orderOfftargetsBy = "predicted_cleavage_score",
                        allowed.mismatch.PAM = 2, overwrite = TRUE)
