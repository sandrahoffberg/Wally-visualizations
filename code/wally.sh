#!/usr/bin/env bash

source ./config.sh

attached_bams=$(find -L ../data -name "*.bam")

/opt/wally/src/wally region -r ${chromosome}:${start_position}-${end_position}:../results/${start_position}_${end_position}_${file_name} ${min_read_map_quality_discovery} ${BED_file} ${paired_end_view} ${supplementary_alignments} ${show_clips} ${num_horizontal_images} ${plot_width} ${plot_height} -g ${reference} ${attached_bams}