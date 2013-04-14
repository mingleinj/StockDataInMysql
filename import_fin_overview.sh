#!/bin/bash
#This script will download Financial data of stocks entered on the standard input.
#The downloaded CSV files will then be imported into MySQL database using mysqlimport tool
	 
	#Enter your database parameters here
	DB='stock'
	HOST='localhost'
	USER='root'
	PASS='M1ng@2011'
	TAB_PREFIX='fin_'
	 
	DB_PARAMS="-u ${USER} -h ${HOST} -p${PASS} ${DB}"
	

	
	
	
	
	mysql -e "LOAD DATA LOCAL INFILE 'finviz_overview.csv' INTO TABLE m_overview FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  IGNORE 1 LINES (id, ticker, company, sector, industry, country, marketCap, PE, Price, changes, volume) "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	
