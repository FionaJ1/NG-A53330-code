./bin/augustus --species=pasa1 --AUGUSTUS_CONFIG_PATH=./training/Augustus/conf --extrinsicCfgFile=./training/Augustus/conf/extrinsic/extrinsic.cfg  --uniqueGeneId=true --noInFrameStop=true --gff3=on --genemodel=complete --strand=both ./genome.mask.fasta.3 > ./genome.mask.fasta.3.augustus
