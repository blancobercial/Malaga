##Run in mothur ver. 1.43
##make the contigs based in the Forward and reverse files for each sample. Trim to the overlapping region (since it is about 130 bp is covered totally for both F & R), only keep inserts if Q>30, and if there is a disagreement between F&R, keep as ambiguous unless the difference between both Q > 10
make.contigs(file=malaga, deltaq=10, insert=30, trimoverlap=T, processors=20)
summary.seqs(fasta=current)
##remove all contigs with any ambiguity, and those with more than 10 homopolymers
screen.seqs(fasta=current, group=current, maxambig=0, maxhomop=10, contigsreport=current)
summary.seqs(fasta=current)
##remove all seqs with lenght < 115
screen.seqs(fasta=current, group=current, minlength=115)
##Align using as template SILVA 128 (V9 region only)
align.seqs(candidate=current, template=/home/CAM/leocadio/V9/Silva128_ShortAll.fas)
summary.seqs(fasta=current)
##remove tails that were kept (likely leftover primers)
pcr.seqs(fasta=current, group=current, end=692, keepdots=false)
##remove all contigs that do not reach the end of the fragment
screen.seqs(fasta=current, group=current, name=current, end=692)
summary.seqs(fasta=current)
##remove all contigs that do not start at the beginning of the fragment
screen.seqs(fasta=current, group=current, name=current, start=1)
summary.seqs(fasta=current)
##remove all seqs with lenght < 115 (if created during removal of tails)
screen.seqs(fasta=current, group=current, minlength=115)
summary.seqs(fasta=current)
##create uniques
unique.seqs(fasta=current)
summary.seqs(fasta=current, name=current)
get.current()
##removal of chimeras
chimera.vsearch(fasta=current, name=current, group=current, dereplicate=f)
remove.seqs(fasta=current, accnos=current, group=current, name=current, dups=t)
summary.seqs(fasta=current, name=current)
##removal of PCR errors using UNOISE
pre.cluster(fasta=current, name=current, group=current, diffs=1, method=unoise)
degap.seqs(fasta=current)
##Classify against Silva 128 (nr version, not the available from mothur)
classify.seqs(fasta=current, template=/home/CAM/leocadio/V9/Silva128_ShortAll.ng.fasta, taxonomy=/home/CAM/leocadio/V9/taxmap_slv_ssu_ref_128_ShortAll.txt, group=current)

