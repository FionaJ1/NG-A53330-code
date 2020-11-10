CMD:	/Launch_PASA_pipeline_ly.pl -c alignAssembly.config -C -R -g /00.data/genome.fa -t all.fasta.clean -T -u all.fasta --ALIGNERS blat --CPU 10 -N 2

CMD[1]:	./scripts/upload_transcript_data.dbi -M genome -t all.fasta.clean  -f NULL 

CMD[2]:	./scripts/run_spliced_aligners_ly.pl --aligners blat --genome /00.data/genome.fa --transcripts all.fasta.clean -I 500000 -N 2 --CPU 10

CMD[3]:	./scripts/import_spliced_alignments.dbi -M genome  -A blat -g blat.spliced_alignments.gff3

CMD[4]:	./scripts/validate_alignments_in_db.dbi -M genome -g /00.data/genome.fa -t all.fasta.clean --MAX_INTRON_LENGTH 500000 --CPU 10   --NUM_BP_PERFECT_SPLICE_BOUNDARY 0 --MIN_PERCENT_ALIGNED 75 > alignment.validations.output

CMD[5]:	./scripts/update_alignment_status.dbi -M genome < alignment.validations.output  > pasa_run.log.dir/alignment.validation_loading.output

CMD[6]:	./scripts/PASA_transcripts_and_assemblies_to_GFF3.dbi -M genome -v -A -P blat > genome.valid_blat_alignments.gff3

CMD[7]:	./scripts/PASA_transcripts_and_assemblies_to_GFF3.dbi -M genome -v -A -P blat -B  > genome.valid_blat_alignments.bed

CMD[8]:	./scripts/PASA_transcripts_and_assemblies_to_GFF3.dbi -M genome -v -A -P blat -T  > genome.valid_blat_alignments.gtf

CMD[9]:	./scripts/PASA_transcripts_and_assemblies_to_GFF3.dbi -M genome -f -A -P blat > genome.failed_blat_alignments.gff3

CMD[10]:	./scripts/PASA_transcripts_and_assemblies_to_GFF3.dbi -M genome -f -A -P blat -B  > genome.failed_blat_alignments.bed

CMD[11]:	./scripts/PASA_transcripts_and_assemblies_to_GFF3.dbi -M genome -f -A -P blat -T  > genome.failed_blat_alignments.gtf

CMD[12]:	./scripts/polyA_site_transcript_mapper.dbi -M genome -c all.fasta.cln -g /00.data/genome.fa -t all.fasta > pasa_run.log.dir/polyAsite_analysis.out

CMD[13]:	./scripts/polyA_site_summarizer.dbi -M genome -g /00.data/genome.fa  > genome.polyAsites.fasta

CMD[14]:	./scripts/reassign_clusters_via_valid_align_coords.dbi -M genome  > pasa_run.log.dir/cluster_reassignment_by_valid_alignment_coords.default.out

CMD[15]:	./scripts/ensure_single_valid_alignment_per_cdna_per_cluster.pl -M genome > pasa_run.log.dir/ensuring_single_valid_alignment_per_cdna_per_cluster.log

CMD[16]:	./scripts/assemble_clusters.dbi -G /00.data/genome.fa  -M genome  -T 10  > genome.pasa_alignment_assembly_building.ascii_illustrations.out

CMD[17]:	./scripts/assembly_db_loader.dbi -M genome > pasa_run.log.dir/alignment_assembly_loading.out

CMD[18]:	./scripts/subcluster_builder.dbi -G /00.data/genome.fa -M genome  > pasa_run.log.dir/alignment_assembly_subclustering.out

CMD[19]:	./scripts/populate_mysql_assembly_alignment_field.dbi -M genome -G /00.data/genome.fa

CMD[20]:	./scripts/populate_mysql_assembly_sequence_field.dbi -M genome -G /00.data/genome.fa

CMD[21]:	./scripts/subcluster_loader.dbi -M genome  < pasa_run.log.dir/alignment_assembly_subclustering.out 

CMD[22]:	./scripts/alignment_assembly_to_gene_models.dbi -M genome -G /00.data/genome.fa

CMD[23]:	./scripts/PASA_transcripts_and_assemblies_to_GFF3.dbi -M genome -a  > genome.pasa_assemblies.gff3

CMD[24]:	./scripts/PASA_transcripts_and_assemblies_to_GFF3.dbi -M genome -a -B  > genome.pasa_assemblies.bed

CMD[25]:	./scripts/PASA_transcripts_and_assemblies_to_GFF3.dbi -M genome -a -T  > genome.pasa_assemblies.gtf

CMD[26]:	./scripts/describe_alignment_assemblies_cgi_convert.dbi -M genome  > genome.pasa_assemblies_described.txt

