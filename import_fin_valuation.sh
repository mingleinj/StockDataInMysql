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
	

	
	
	mysql -e "LOAD DATA LOCAL INFILE 'finviz_valuation.csv' INTO TABLE m_valuation FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  IGNORE 1 LINES (id, ticker, marketCap, PE, FwdPE, PEG, PS, PB, PC, PFCF, EPSthisYear, EPSnextYear, EPSpast5Year, EPSnext5Year, Salespast5Year, Price, changes, Volume) "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	
