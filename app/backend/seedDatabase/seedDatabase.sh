#!/usr/bin/env bash
source ../.env
MYSQL_COMMAND="mysql -h${MYSQL_HOST} -uroot -p${MYSQL_ROOT_PASSWORD}"

until $MYSQL_COMMAND -e'SHOW DATABASES'; do
    echo "Waiting for MySQL server to start"
    sleep 10
done

if [ $# -eq 0 ]; then

  SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
  TMP_DIR=$(mktemp -d)

  # Nuke any existing database and create table definitions
  ${MYSQL_COMMAND} < ${SCRIPT_DIR}/tableDefinitions.sql

  # Get raw data
  wget -O ${TMP_DIR}/data.zip http://geonb.snb.ca/downloads/evan/geonb_evan_tsv.zip
  unzip -o -d ${TMP_DIR} ${TMP_DIR}/data.zip

  # For every file in the raw data
  for file in $(ls ${TMP_DIR}/*.tsv); do 
    # Turn TSV to CSV
    perl -lpe 's/"/""/g; s/^|$/"/g; s/\t/","/g;' < ${file} | sed '/,\"1\",/d' | sed '/^$/d'  > ${file%.tsv}.csv
    
    # Import CSV into MySQL table
    TABLE=$(basename ${file%.tsv})
    ${MYSQL_COMMAND} salesData -e"LOAD DATA LOCAL INFILE '${file%.tsv}.csv' 
      INTO TABLE ${TABLE} 
      FIELDS TERMINATED BY ',' 
      ENCLOSED BY '\"'
      LINES TERMINATED BY '\n'
      IGNORE 1 ROWS;"
  done

  # Remove temporary directory
  rm -R ${TMP_DIR}
fi

# Start API server
exec npm start
