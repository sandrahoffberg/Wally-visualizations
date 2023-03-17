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


if [ -z ${1} ]; then
    start_position=10000
else
    start_position=${1}
fi


if [ -z ${2} ]; then
    end_position=1000000
else
    end_position=${2}
fi



if [ -z ${3} ]; then
    file_name=plot
else
    file_name=${3}
fi


# If a reference file has not been specified in the app panel, find it
if [ -z ${4} ]; then
    reference=$(find -L ../data/ -name "*.fa")
else
    reference=${4}
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

## SV discovery options in delly call
if [ -z ${5} ]; then
    min_read_map_quality_discovery=
else
    min_read_map_quality_discovery=--map_qual ${5}
fi


# If a reference file has not been specified in the app panel, find it
if [ -z ${6} ]; then
    BED_file=$(find -L ../data/ -name "*.bed")
else
    BED_file=${6}
fi


## SV discovery options in delly call
if [ ${7} == "no" ]; then
    paired_end_view=
else
    paired_end_view=--paired
fi


## SV discovery options in delly call
if [ ${8} -- "no" ]; then
    supplementary_alignments=
else
    supplementary_alignments=--supplementary
fi


## SV discovery options in delly call
if [ ${9} -- "no" ]; then
    show_clips=
else
    show_clips=--clip
fi


## SV discovery options in delly call
if [ -z ${10} ]; then
    num_horizontal_images=
else
    num_horizontal_images=--split ${10}
fi


## SV discovery options in delly call
if [ -z ${11} ]; then
    plot_width=
else
    plot_width=--width ${11}
fi


## SV discovery options in delly call
if [ -z ${12} ]; then
    plot_height=
else
    plot_height=--height ${12}
fi