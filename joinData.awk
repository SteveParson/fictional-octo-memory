BEGIN {
    FS=",";
    print "DATE,PAN,ADDRESS,MUNICIPALITY,ASSESSEDVALUE,SALEPRICE";
} 


ARGIND==1 {
    assessedVal[$1] = $6;
    address[$1] = $2; 
    locale[$1] = $3;
}

ARGIND==2 {
    place[$1] = $2;
}

ARGIND==3 {
    if (assessedVal[$1] != "" && $3 != "1") {
        print $2 "," $1 "," address[$1] "," place[locale[$1]] "," assessedVal[$1] "," $3;
    }
}