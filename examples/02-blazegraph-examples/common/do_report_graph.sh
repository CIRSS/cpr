#!/usr/bin/env bash

# save command line arguments
script_id=$1
script_description=$2

run_dir=./run

# define name of result file
script_file=${run_dir}/${script_id}.sh
output_file=${run_dir}/${script_id}.txt
dot_file=${run_dir}/${script_id}.gv
png_file=${run_dir}/${script_id}.png

# copy query from stdin to the query file
echo "# ${script_description}" > ${script_file}
IFS=''; while read line
do
    echo "$line" >> ${script_file}
done

# execute the script on the given data file and save results as dot file
bash ${script_file} > ${dot_file}

# use graphviz to create the visualization
dot -Tpng ${dot_file} -o ${png_file} 

# print the script results
echo
echo "******************************************* ${script_id} ************************************************"
echo
cat ${script_file}
echo "-------------------------------------------------- OUTPUT -----------------------------------------------"
echo
cat ${dot_file}
echo
