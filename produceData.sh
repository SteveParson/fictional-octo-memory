#!/usr/bin/env bash

temp_dir=$(mktemp -d)
wget -O ${temp_dir}/data.zip http://geonb.snb.ca/downloads/evan/geonb_evan_tsv.zip
unzip -o -d ${temp_dir} ${temp_dir}/data.zip

for file in $(ls ${temp_dir}/*.tsv); do 
  perl -lpe 's/"/""/g; s/^|$/"/g; s/\t/","/g;' < ${file} | sed '1d' | sed '/,1,/d' | sed '/^$/d' | sed 's/"//g' > ${file%.tsv}.csv
done

awk -f joinData.awk ${temp_dir}/Tombstone.csv ${temp_dir}/TA.csv ${temp_dir}/Sales.csv > AllSalesData.csv
rm -R ${temp_dir}
