Trinity --seqType fq --left *_1.clean.fq.gz --right *_2.clean.fq.gz  --CPU 20 --max_memory 200G --normalize_reads --full_cleanup --min_glue 2 --min_kmer_cov 2 --KMER_SIZE 25 --output trinity.out 
