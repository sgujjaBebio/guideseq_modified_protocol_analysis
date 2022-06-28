sample=${1}
bwa mem -t 2 version0.6.0/genome.fa  ${sample}.r1.fastq ${sample}.r2.fastq | samtools view -Sb -@ 2 - | samtools sort -@ 2 - >  ${sample}.new.bam
	
samtools index  ${sample}.new.bam
	

