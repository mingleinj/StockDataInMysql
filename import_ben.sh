#!/bin/bash
#This script will download Financial data of stocks entered on the standard input.
#The downloaded CSV files will then be imported into MySQL database using mysqlimport tool
	 
	#Enter your database parameters here
	DB='stock'
	HOST='localhost'
	USER='root'
	PASS='M1ng@2011'
	TAB_PREFIX='yb_'
	 
	DB_PARAMS="-u ${USER} -h ${HOST} -p${PASS} ${DB}"
	CREATE="DROP TABLE IF EXISTS benchmark; CREATE TABLE benchmark (id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, ticker VARCHAR(20), day DATE,  open DECIMAL(8,3), high DECIMAL(8,3), low DECIMAL(8,3), close DECIMAL(8,3), volume BIGINT, adj_close DECIMAL(8,3))"
	URL='http://ichart.finance.yahoo.com/table.csv?s=_SYMBOL_&d=1&e=23&f=2013&g=d&a=2&b=13&c=1986&ignore=.csv'
	
	mysql -e "${CREATE//_SYMBOL_/$SYMBOL}" ${DB_PARAMS}
	 
	while read SYMBOL; do
	  curl -o "${TAB_PREFIX}${SYMBOL}.csv" -q "${URL/_SYMBOL_/$SYMBOL}"
	
	  mysql -e "LOAD DATA LOCAL INFILE '"${TAB_PREFIX}${SYMBOL}.csv"' INTO TABLE benchmark FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  IGNORE 1 LINES (day, open, high, low, close, volume,  adj_close) SET ticker = '$SYMBOL'"  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	done
