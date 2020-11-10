BuildDatabase -engine ncbi -name genome ./genome.fa
RepeatModeler -database genome -engine ncbi -pa 15 >&run.out
