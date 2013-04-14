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
	CREATE="DROP TABLE IF EXISTS financial; CREATE TABLE financial (id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, ticker VARCHAR(20), marketCap DECIMAL(10,3),  DivdendYield VARCHAR(20), ReturnOnAssets VARCHAR(20), ReturnOnEquity VARCHAR(20), ReturnOnInvest VARCHAR(20), CurrentRatio DECIMAL(8,3), QuickRatio DECIMAL(8,3),  LTDebetEquity DECIMAL(8,3), TotalDebetEquity DECIMAL(8,3), GrossMargin VARCHAR(20), OperatingMargin VARCHAR(20), ProfitMargin VARCHAR(20), Earningsdate DateTime, Price DECIMAL(8,3), Change VARCHAR(20), Volume INT(11))"
	URL='http://www.finviz.com/export.ashx?v=161'
	
	mysql -e "CREATE" ${DB_PARAMS}
	 
	
	curl -o "financial.csv" -q "${URL}"
	
	mysql -e "LOAD DATA LOCAL INFILE '"financial.csv"' INTO TABLE financial FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  IGNORE 1 LINES (id, ticker, marketCap, DivdendYield, ReturnOnAssets, ReturnOnEquity, ReturnOnInvest, CurrentRatio, QuickRatio, LTDebetEquity, TotalDebetEquity, GrossMargin, OperatingMargin, ProfitMargin, Earningsdate, Price, Change, Volume) "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	
