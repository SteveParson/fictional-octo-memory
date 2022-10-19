mkdir ./tmp
(
    cd ./tmp
    wget -O ./data.zip http://geonb.snb.ca/downloads/evan/geonb_evan_tsv.zip
    unzip data.zip
    dos2unix *.tsv
    dos2unix *.txt
    sqlite-utils insert assesment.db assesment Assessment.tsv --tsv --encoding=iso8859 --detect-types
    sqlite-utils insert pidpan.db pidpan PIDPAN.tsv --tsv --encoding=iso8859 --detect-types
    sqlite-utils insert sales.db sales Sales.tsv --tsv --encoding=iso8859 --detect-types
    sqlite-utils insert ta.db ta TA.tsv --tsv --encoding=iso8859 --detect-types
    sqlite-utils insert tombstone.db tombstone Tombstone.tsv --tsv --encoding=iso8859 --detect-types
)