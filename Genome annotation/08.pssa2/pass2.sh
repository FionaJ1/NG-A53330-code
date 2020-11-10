./pasa_bin/scripts/build_comprehensive_transcriptome.dbi -c alignAssembly.config -t all.fasta
./pasa_bin/scripts/Launch_PASA_pipeline_ly.pl -c annotCompare.config -g ./genome.fa -t ./all.fasta -A -L --annots_gff3 evm.cds
