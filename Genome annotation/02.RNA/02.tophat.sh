tophat -p 6 --max-intron-length 500000 -m 2 --library-type fr-unstranded  -o ./out  ./genome  *_1.clean.fq.gz *_2.clean.fq.gz
cufflinks  -I 500000 -p 1 --library-type fr-unstranded -L CUFF -o ./out  aaccepted_hits.bam
