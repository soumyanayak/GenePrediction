##blast LINE vs Oryza sativa

#blastn -query /home/group1/Meeta/plant_repeat_db_blast_results/LINE_arabidopsis.fa -db /home/group1/Meeta/input_files/sequenced_genomes_misc/O_sativa/Os.fa -outfmt 11 -out /home/group1/Meeta/plant_repeat_db_blast_results/LINE_elements/LINE_vs_Osativa/LINE_osativa.ASN.1 -max_target_seqs 1

#blast_formatter -archive /home/group1/Meeta/plant_repeat_db_blast_results/LINE_elements/LINE_vs_Osativa/LINE_osativa.ASN.1 -outfmt 0 -out /home/group1/Meeta/plant_repeat_db_blast_results/LINE_elements/LINE_vs_Osativa/LINE_osativa.aln

#blast_formatter -archive /home/group1/Meeta/plant_repeat_db_blast_results/LINE_elements/LINE_vs_Osativa/LINE_osativa.ASN.1 -outfmt 6 -out /home/group1/Meeta/plant_repeat_db_blast_results/LINE_elements/LINE_vs_Osativa/LINE_osativa.csv


##blast repeatscoutrepeats vs repbase

#blastn -query /home/ssubha/Plant_Genomics/mapping_reads_on_repeats/repeatscoutrepeats.fa -db /opt/repeat_finders/RepeatMasker/Libraries/RepeatMasker.lib -outfmt 11 -out /home/ssubha/Plant_Genomics/blast_repeatscoutrepeats_vs_repbase/repeatscoutrepeats_vs_repbase.ASN.1 

#blast_formatter -archive /home/ssubha/Plant_Genomics/blast_repeatscoutrepeats_vs_repbase/repeatscoutrepeats_vs_repbase.ASN.1 -outfmt 0 -out /home/ssubha/Plant_Genomics/blast_repeatscoutrepeats_vs_repbase/repeatscoutrepeats_vs_repbase.aln

#blast_formatter -archive /home/ssubha/Plant_Genomics/blast_repeatscoutrepeats_vs_repbase/repeatscoutrepeats_vs_repbase.ASN.1 -outfmt 6 -out /home/ssubha/Plant_Genomics/blast_repeatscoutrepeats_vs_repbase/repeatscoutrepeats_vs_repbase.csv

## 27 Aug ##

##blast repeatscoutrepeats vs TE database

#blastn -query /home/ssubha/Plant_Genomics/Suran/mapping_reads_on_repeats/repeatscoutrepeats.fa -db /home/ssubha/Plant_Genomics/input_files/plant_repeats.fasta -outfmt 11 -out /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_TE_database/repscout_TE.ASN.1

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_TE_database/repscout_TE.ASN.1 -outfmt 0 -out /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_TE_database/repscout_TE.aln

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_TE_database/repscout_TE.ASN.1 -outfmt 6 -out /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_TE_database/repscout_TE.csv

#/home/ssubha/Plant_Genomics/Databases/all_repeats.fasta

##blast repeatscoutrepeats vs Bvulgaris

#blastn -query /home/ssubha/Plant_Genomics/Suran/mapping_reads_on_repeats/repeatscoutrepeats.fa -db /home/ssubha/Plant_Genomics/input_files/Bv_unplaced.scaf.fa -outfmt 11 -out /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_Bvulgaris/repscout_vs_Bvulgaris.ASN.1

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_Bvulgaris/repscout_vs_Bvulgaris.ASN.1 -outfmt 0 -out /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_Bvulgaris/repscout_vs_Bvulgaris.aln

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_Bvulgaris/repscout_vs_Bvulgaris.ASN.1 -outfmt 6 -out /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_Bvulgaris/repscout_vs_Bvulgaris.csv


##blast repeatscoutrepeats vs Silene latifolia
#blastn -query /home/ssubha/Plant_Genomics/Suran/mapping_reads_on_repeats/repeatscoutrepeats.fa -db /home/ssubha/Plant_Genomics/input_files/Silene_cated_contigs_CL.fasta -outfmt 11 -out /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_Silene/repscout_Silene.ASN.1

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_Silene/repscout_Silene.ASN.1 -outfmt 0 -out /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_Silene/repscout_Silene.aln

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_Silene/repscout_Silene.ASN.1 -outfmt 6 -out /home/ssubha/Plant_Genomics/Suran/blast_results/blast_repeatscoutrepeats_vs_Silene/repscout_Silene.csv

## Aug 29

##blast LTR_scaffolds vs repbase

#blastn -query /home/ssubha/Plant_Genomics/Suran/LTR_Finder/LTR_scaffolds.fa -db /opt/repeat_finders/RepeatMasker/Libraries/RepeatMasker.lib -outfmt 11 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_scafolds_vs_repbase/LTR_scaffolds_repbase.ASN.1 

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_scafolds_vs_repbase/LTR_scaffolds_repbase.ASN.1 -outfmt 0 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_scafolds_vs_repbase/LTR_scaffolds_repbase.aln

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_scafolds_vs_repbase/LTR_scaffolds_repbase.ASN.1 -outfmt 6 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_scafolds_vs_repbase/LTR_scaffolds_repbase.csv

##Aug 30

##blast LTR_finder_sequences vs repbase

#blastn -query /home/ssubha/Plant_Genomics/Suran/LTR_Finder/ltr_finder_AhG_sequences.fa -db /opt/repeat_finders/RepeatMasker/Libraries/RepeatMasker.lib -outfmt 11 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_repbase/LTR_finder_repbase.ASN.1

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_repbase/LTR_finder_repbase.ASN.1 -outfmt 0 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_repbase/LTR_finder_repbase.aln

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_repbase/LTR_finder_repbase.ASN.1 -outfmt 6 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_repbase/LTR_finder_repbase.csv

##blast LTR_finder_sequences vs TE database

#blastn -query /home/ssubha/Plant_Genomics/Suran/LTR_Finder/ltr_finder_AhG_sequences.fa -db /home/ssubha/Plant_Genomics/input_files/plant_repeats.fasta -outfmt 11 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_TE_database/LTR_finder_TE_database.ASN.1

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_TE_database/LTR_finder_TE_database.ASN.1 -outfmt 0 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_TE_database/LTR_finder_TE_database.aln

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_TE_database/LTR_finder_TE_database.ASN.1 -outfmt 6 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_TE_database/LTR_finder_TE_database.csv

##blast LTR_finder_sequences vs Bvulgaris
#blastn -query /home/ssubha/Plant_Genomics/Suran/LTR_Finder/ltr_finder_AhG_sequences.fa -db /home/ssubha/Plant_Genomics/input_files/Bv_unplaced.scaf.fa -outfmt 11 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Bvulgaris/LTR_finder_Bvulgaris.ASN.1

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Bvulgaris/LTR_finder_Bvulgaris.ASN.1 -outfmt 0 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Bvulgaris/LTR_finder_Bvulgaris.aln

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Bvulgaris/LTR_finder_Bvulgaris.ASN.1 -outfmt 6 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Bvulgaris/LTR_finder_Bvulgaris.csv


##blast LTR_finder_sequences vs Silene latifolia
#blastn -query /home/ssubha/Plant_Genomics/Suran/LTR_Finder/ltr_finder_AhG_sequences.fa -db /home/ssubha/Plant_Genomics/input_files/Silene_cated_contigs_CL.fasta -outfmt 11 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Silene/LTR_finder_Silene.ASN.1

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Silene/LTR_finder_Silene.ASN.1 -outfmt 0 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Silene/LTR_finder_Silene.aln

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Silene/LTR_finder_Silene.ASN.1 -outfmt 6 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Silene/LTR_finder_Silene.csv

##blast LTR_finder_sequences vs Vitis vinifera
#blastn -query /home/ssubha/Plant_Genomics/Suran/LTR_Finder/ltr_finder_AhG_sequences.fa -db /home/ssubha/Plant_Genomics/Suran/RepeatMasker/Vitis/Vv_genome.fa -outfmt 11 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Vitis/LTR_finder_Vitis.ASN.1

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Vitis/LTR_finder_Vitis.ASN.1 -outfmt 0 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Vitis/LTR_finder_Vitis.aln

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Vitis/LTR_finder_Vitis.ASN.1 -outfmt 6 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Vitis/LTR_finder_Vitis.csv

##blast LTR_finder_sequences vs Solanum lycopersicum
#blastn -query /home/ssubha/Plant_Genomics/Suran/LTR_Finder/ltr_finder_AhG_sequences.fa -db /home/ssubha/Plant_Genomics/Suran/RepeatMasker/S.lycopersicum/S.lycopersicum.fa -outfmt 11 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Solanum/LTR_finder_Solanum.ASN.1

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Solanum/LTR_finder_Solanum.ASN.1 -outfmt 0 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Solanum/LTR_finder_Solanum.aln

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Solanum/LTR_finder_Solanum.ASN.1 -outfmt 6 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Solanum/LTR_finder_Solanum.csv

##Aug 31

##blast LTR_finder_sequences vs Sorghum bicolor
#blastn -query /home/ssubha/Plant_Genomics/Suran/LTR_Finder/ltr_finder_AhG_sequences.fa -db /home/ssubha/Plant_Genomics/Suran/RepeatMasker/Sorghum/Sb.fa -outfmt 11 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Sorghum/LTR_Sorghum.ASN.1
  
#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Sorghum/LTR_Sorghum.ASN.1 -outfmt 0 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Sorghum/LTR_Sorghum.aln

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Sorghum/LTR_Sorghum.ASN.1 -outfmt 6 -out /home/ssubha/Plant_Genomics/Suran/blast_results/LTR_finder_Sorghum/LTR_Sorghum.csv


##Sep 6

##blast Mips fasta vs repbase

#blastn -query /home/ssubha/Plant_Genomics/Suran/blast_Mips/mips_TE_vs_genomes/Ah_scafsF.substr.fa -db /opt/repeat_finders/RepeatMasker/Libraries/RepeatMasker.lib -outfmt 11 -out /home/ssubha/Plant_Genomics/Suran/blast_results/Mips_fasta_vs_repbase/mips_vs_repbase.top.ASN.1 -max_target_seqs 1

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/Mips_fasta_vs_repbase/mips_vs_repbase.top.ASN.1 -outfmt 0 -out /home/ssubha/Plant_Genomics/Suran/blast_results/Mips_fasta_vs_repbase/mips_vs_repbase.top.aln 

#blast_formatter -archive /home/ssubha/Plant_Genomics/Suran/blast_results/Mips_fasta_vs_repbase/mips_vs_repbase.top.ASN.1 -outfmt 6 -out /home/ssubha/Plant_Genomics/Suran/blast_results/Mips_fasta_vs_repbase/mips_vs_repbase.top.csv


## Nov 22 ##

## Soumya noncoding-rna refmrna ##
#makeblastdb -in /home/interns/soumya/analysis-refseq/refMrna.fa -dbtype nucl

#blastn -query /home/interns/soumya/noncoding-rnas.fa -db /home/interns/soumya/analysis-refseq/refMrna.fa -outfmt 11 -out /home/interns/soumya/analysis-refseq/noncodingrnas.ASN.1 

#blast_formatter -archive /home/interns/soumya/analysis-refseq/noncodingrnas.ASN.1 -outfmt 0 -out /home/interns/soumya/analysis-refseq/noncodingrnas.aln 

#blast_formatter -archive /home/interns/soumya/analysis-refseq/noncodingrnas.ASN.1 -outfmt 6 -out /home/interns/soumya/analysis-refseq/noncodingrnas.csv

blastn -query /home/interns/soumya/noncoding-rnas.fa -db /home/interns/soumya/analysis-refseq/refMrna.fa -outfmt 11 -out /home/interns/soumya/analysis-refseq/noncodingrnas.top.ASN.1 -max_target_seqs 1

blast_formatter -archive /home/interns/soumya/analysis-refseq/noncodingrnas.ASN.1 -outfmt 0 -out /home/interns/soumya/analysis-refseq/noncodingrnas.top.aln

blast_formatter -archive /home/interns/soumya/analysis-refseq/noncodingrnas.ASN.1 -outfmt 6 -out /home/interns/soumya/analysis-refseq/noncodingrnas.top.csv

