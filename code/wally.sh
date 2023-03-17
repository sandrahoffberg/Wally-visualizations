source ./config.sh

attached_bams=$(find -L ../data ../results -name "*.bam")


/wally/src/wally region -r chr11:${start_position}-${end_position}:../results/${start_position}_${end_position}_${file_name} ${min_read_map_quality_discovery} ${BED_file} ${paired_end_view} ${supplementary_alignments} ${show_clips} ${num_horizontal_images} ${plot_width} ${plot_height} -g ${reference} ${attached_bams}


for bam in ${attached_bams}; do 
samtools view ${bam} chr11:1000-1000000 | cut -f 1 | sort | uniq > ../results/reads

/wally/src/wally dotplot -R ../results/reads -g ${reference} /data/sequencing_reads_chr11/data/SRR10271324_chr11/SRR10271324_chr11_RG.bam
done
