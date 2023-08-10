#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
else
    echo "args:"
    for i in $*; do 
        echo $i 
    done
    echo ""
fi



# URL of the s3 bucket with bams for analysis
if [ -z ${1} ]; then
    num_bam_files=$(find -L ../data -name "*.bam" | wc -l)
    if [ ${num_bam_files} -gt 0 ]; then
        echo "Using bams in the /data folder"
        data_dir="../data"
    else
        echo "There are no sample files available for this capsule.  Please either add some to the /data folder or provide a URL to an S3 bucket."
    fi
else
    s3_url=${1}
    
    temporary_data_dir=../scratch/data

    # location to download the bams
    if [ -z ${2} ]; then
        data_dir=${temporary_data_dir}
    else
        data_dir=${2}
    fi
    
    #get BAM file(s) that have been trimmed, aligned to reference, sorted, read groups adjusted if necessary, and indexed
    echo "Downloading data from the S3 bucket at the provided URL."
    aws s3 sync --no-sign-request --only-show-errors ${s3_url} ${data_dir}
fi




if [ -z ${3} ]; then
    chromosome=chr11
else
    chromosome=${3}
fi


if [ -z ${4} ]; then
    start_position=10000
else
    start_position=${4}
fi


if [ -z ${5} ]; then
    end_position=1000000
else
    end_position=${5}
fi



if [ -z ${6} ]; then
    file_name="plot"
else
    file_name="${6}"
fi


# If a reference file has not been specified in the app panel, find it
if [ -z ${7} ]; then
    reference=$(find -L ../data/ -name "*.fa")
else
    reference=${7}
fi

# Check that there is only 1 reference
number_references=$(find -L ../data/ -name "*.fa" | wc -l )
if [ ${number_references} -eq 0 ]; then
    echo "Check your input data: there is no reference .fa file."
    exit 1
elif [ ${number_references} -gt 1 ]; then
    echo "Check your input data: there are multiple reference .fa files."
    exit 1
fi

# make the path absolute
reference=$PWD/${reference}



## Auxilliary Parameters

if [ -z ${8} ]; then
    min_read_map_quality_discovery=""
else
    min_read_map_quality_discovery="--map_qual ${8}"
fi


if [ -z ${9} ]; then
    BED_file=$(find -L ../data/ -name "*.bed")
else
    BED_file=${9}
fi


if [ "${10}" == "no" ]; then
    paired_end_view=""
else
    paired_end_view="--paired"
fi


if [ "${11}" == "no" ]; then
    supplementary_alignments=""
else
    supplementary_alignments="--supplementary"
fi


if [ "${12}" == "no" ]; then
    show_clips=""
else
    show_clips="--clip"
fi


if [ -z ${13} ]; then
    num_horizontal_images=""
else
    num_horizontal_images="--split ${13}"
fi


if [ -z ${14} ]; then
    plot_width=""
else
    plot_width="--width ${14}"
fi


if [ -z ${15} ]; then
    plot_height=""
else
    plot_height="--height ${15}"
fi