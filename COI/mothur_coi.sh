##Run in mothur ver. 1.43
##make the contigs based in the Forward and reverse files for each sample. Keep inserts if Q>30, and if there is a disagreement between F&R, keep as ambiguous unless the difference between both Q > 10
make.contigs(file=malaga, deltaq=10, insert=30, trimoverlap=F, processors=20)
summary.seqs(fasta=current)
##remove all contigs with any ambiguity, and those with more than 10 homopolymers
screen.seqs(fasta=current, group=current, maxambig=0, maxhomop=10, contigsreport=current)
summary.seqs(fasta=current)
##remove all seqs with lenght < 250
screen.seqs(fasta=current, group=current, minlength=250)
summary.seqs(fasta=current)
unique.seqs(fasta=current)
summary.seqs(fasta=current, name=current)
get.current()
##removal of chimeras
chimera.vsearch(fasta=current, name=current, group=current, dereplicate=f)
remove.seqs(fasta=current, accnos=current, group=current, name=current, dups=t)
summary.seqs(fasta=current, name=current)
##removal of PCR errors using UNOISE
pre.cluster(fasta=current, name=current, group=current, diffs=1, method=unoise)
##get uncompressed table from mothur
count.seqs(count=current, compress=f)
