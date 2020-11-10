#!/bin/bash
./EVidenceModeler-1.1.1/EvmUtils/evidence_modeler.pl -G genomicseq.fa -g denovo.gff3 -w weights.txt -e transcript.gff3  -p protein.gff3  --min_intron_length 20  --exec_dir ./07.evm/fasta_dir/015.run/fa/fa.result > ./07.evm/fasta_dir/015.run/fa/fa.result/evm.out 2> ./07.evm/fasta_dir/015.run/fa/fa.result/stderr

