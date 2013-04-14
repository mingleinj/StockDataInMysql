#!/bin/bash
#This script will download Financial data of stocks entered on the standard input.
#The downloaded CSV files will then be imported into MySQL database using mysqlimport tool
	 
	#Enter your database parameters here
	DB='stock'
	HOST='localhost'
	USER='root'
	PASS='M1ng@2011'
	TAB_PREFIX='yben_'
	 
	DB_PARAMS="-u ${USER} -h ${HOST} -p${PASS} ${DB}"
	CREATE="DROP TABLE IF EXISTS KeyBenchmark; CREATE TABLE valuation (id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, ticker VARCHAR(60), MarkeCap DECIMAL(8,3), P/E DECIMAL(8,3), Forward P/E DECIMAL(8,3),  PEG DECIMAL(8,3), P/S DECIMAL(8,3), P/B DECIMAL(8,3), P/Cash DECIMAL(8,3), PriceToFreeCashFlow DECIMAL(8,3))"
	
	mysql -e "${CREATE//_SYMBOL_/$SYMBOL}" ${DB_PARAMS}
	 
	URL='http://finviz.com/export.ashx?v=121&ft=4'
	
	curl -o "$valuation.csv" -L -q "${URL}"
	
	mysql -e "LOAD DATA LOCAL INFILE '"$valuation.csv"' INTO TABLE valuation FIELDS TERMINATED BY ','  ENCLOSED BY '\"'
	   LINES TERMINATED BY '\n'  IGNORE 1 LINES  (description , OneDayPriceChange, MarketCap, pe, roe,  DivYield, LongDebtToEquity, PriceBookValue, NetProfitMargin, PriceToFreeCashFlow) set parent_ID= 4 "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	