#!/bin/bash
#$ -cwd
#$ -P dserre-lab
#$ -o blastQsubStdOut.txt
#$ -e blastQsubStdErr.txt
#$ -l mem_free=0.10G
#$ -q threaded.q
#$ -pe thread 30
#$ -N blast
##$ -sync y
#$ -t 1-37
#$ -tc 5

declare -a fileList=("Amoebozoa_18S_2_R_" "Amoebozoa_Ami6F1_Ami9R_" "Apicomplexa18S_365_F_613_R_" "Bacillariophyta_18SF_28SR_" "Blastocystis18S_F_R_" "Chlorophyta_UCP1_F_UCP1_R_" "Ciliophora_121F_1147R_" "Dinophyceae_18ScomF1_Dino18SR1_" "Diplomonadida_768_F_1059_R_" "Diplomonadida_DimA_DimB_" "Eimeriorina18S_302_F_730_R_" "Entamoeba_JVF_DSPR2_" "Eukaryota_1391F_EukB_" "Eukaryota_E528F_Univ1391RE_" "Eukaryota_E528F_Univ1492RE_" "Eukaryota_EK1F_EK-1520_" "Eukaryota_EK-82F_EK-1520_" "Eukaryota_Euk1A_Euk516r_" "Eukaryota_EUKA_EUKB_" "Eukaryota_F-566_R-1200_" "Eukaryota_FUNF_FUNR_" "Eukaryota_NSI_FR1_" "Eukaryota_TAReuk454FWD1_TAReukREV3_" "Eukaryota_Uni18SF_Uni18SR_" "Fungi_ITSF_ITS-4R_" "Kinetoplastida_18S_4_R_" "Kinetoplastidia_Kineto_kin1_Kineto_kin2_" "Microsporidia_18S_F_R_" "Microsporidia_V1_PMP2_" "Parabasalia18S_288_F_654_R_" "Plasmodium18S_883_F_1126_R_" "Platyhelminthes_18S3_F_3R_" "Rhodophyta_RUBI_F_RUBI_R_" "Spirurida18S_1435_F_1858_R_" "Spirurida18S_F2_R2_" "Trichocephalida18S2_F_R_" "Trichomonadida_TFR1_TFR2_")

/usr/local/packages/ncbi-blast+-2.7.1/bin/blastn \
  -task blastn \
  -negative_gilist ~/SerreDLab-3/cannonm3/unculturedOrgs_8_16_18.gi \
  -db ~/SerreDLab-3/databases/blast/nt \
  -query output/sequences/unique/${fileList[${SGE_TASK_ID} - 1]}sequences.fasta \
  -num_threads 30 \
  -outfmt "7 qseqid sgi evalue length qlen sstart send slen score" \
  -max_hsps 1 \
  -max_target_seqs 10000 \
    > output/blast/${fileList[${SGE_TASK_ID} - 1]}blastResults.txt


