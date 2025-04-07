#!/bin/bash

#1
awk -F'\t' '{sum=0; for(i=1;i<=NF;i++) sum+=$i; print sum}' fin > fout

#2
echo "Hello, world!" > fout

#3
echo "jkdsjfsjdfajsdoifjsiodfj" > fin
cut -c10 fin > fout

#4
paste - - < fin | grep '777' > fout

#5
sort -k2,2V -k3,3n -k4,4n fin > fout

#6
grep -i '[0-9]' fin | grep -vi '[xy]' | awk '{ total += length } END { print total }'

#7
insertion=$(awk 'BEGIN{maxlen=0} !/^#/ {
    if (length($5) > length($4)) {
        diff = length($5) - length($4);
        if (diff > maxlen) {
            maxlen = diff;
            longest = substr($5, length($4)+1);
        }
    }
} END { print longest }' clinvar_20250330.vcf)

deletion=$(awk 'BEGIN{maxlen=0} !/^#/ {
    if (length($4) > length($5)) {
        diff = length($4) - length($5);
        if (diff > maxlen) {
            maxlen = diff;
            longest = substr($4, length($5)+1);
        }
    }
} END { print longest }' clinvar_20250330.vcf)

echo "Longest insertion:" > fout
echo "$insertion" >> fout
echo "Longest deletion:" >> fout
echo "$deletion" >> fout

#8
awk -F':' 'NR > 1 && $1 ~ /^[ab]/ {
    printf("Username: %s, Home: %s, Password: %s\n", $1, $6, $2)
}' fin > fout
