#!/bin/bash
#This script will download Financial data of stocks entered on the standard input.
#The downloaded CSV files will then be imported into MySQL database using mysqlimport tool
	 
	#Enter your database parameters here
	DB='stock'
	HOST='localhost'
	USER='root'
	PASS='M1ng@2011'
	TAB_PREFIX='ykf_'
	 
	DB_PARAMS="-u ${USER} -h ${HOST} -p${PASS} ${DB}"
	CREATE="DROP TABLE IF EXISTS KeyFinancial; CREATE TABLE KeyFinancial (id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, ticker VARCHAR(20), day DATE,  pe DECIMAL(8,3), peg DECIMAL(8,3), pricesale DECIMAL(8,3), dividend DECIMAL(8,3),  earningpershare DECIMAL(8,3))"
	URL='http://finance.yahoo.com/d/quotes.csv?s=_SYMBOL_&f=sd1rr5p5ye'
	
	mysql -e "${CREATE//_SYMBOL_/$SYMBOL}" ${DB_PARAMS}
	 
	while read SYMBOL; do
	  curl -o "${TAB_PREFIX}${SYMBOL}.csv" -L -q "${URL/_SYMBOL_/$SYMBOL}"
	
	  mysql -e "LOAD DATA LOCAL INFILE '"${TAB_PREFIX}${SYMBOL}.csv"' INTO TABLE KeyFinancial FIELDS TERMINATED BY ','  ENCLOSED BY '\"'
	   LINES TERMINATED BY '\n'  (ticker, @varday, pe, peg, pricesale, dividend, earningpershare) SET day = STR_TO_DATE(@varday, '%m/%d/%Y')"  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	done