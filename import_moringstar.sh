#!/bin/bash
#This script will download Financial data of stocks entered on the standard input.
#The downloaded CSV files will then be imported into MySQL database using mysqlimport tool
	 
	#Enter your database parameters here
	
	#Enter your database parameters here
	DB='stock'
	HOST='localhost'
	USER='root'
	PASS='M1ng@2011'
	TAB_PREFIX='morningstar_'
	 
	DB_PARAMS="-u ${USER} -h ${HOST} -p${PASS} ${DB}"
	CREATE="DROP TABLE IF EXISTS m_keyratio; CREATE TABLE m_keyratio (id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, ticker VARCHAR(20), day DATE,  open DECIMAL(8,3), high DECIMAL(8,3), low DECIMAL(8,3), close DECIMAL(8,3), volume BIGINT, adj_close DECIMAL(8,3))"
	URL='http://financials.morningstar.com/ajax/exportKR2CSV.html?t='
	

	 
	while read SYMBOL; do
	  echo "${URL/_SYMBOL_/$SYMBOL}="${URL}${SYMBOL}
	  curl -o "${TAB_PREFIX}${SYMBOL}.csv" -q "${URL}${SYMBOL}"
	  
	 
	
	done
	
	
	

	
	
	
