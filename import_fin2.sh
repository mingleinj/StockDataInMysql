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
	
	CREATE="DROP TABLE IF EXISTS m_financial; CREATE  TABLE m_financial (id INT(11) NOT NULL, ticker VARCHAR(45) NULL, marketCap DECIMAL(10,3) NULL , DivdendYield VARCHAR(45) NULL , ReturnOnAssets VARCHAR(45) NULL , ReturnOnEquity VARCHAR(45) NULL , ReturnOnInvest VARCHAR(45) NULL , CurrentRatio DECIMAL(8,3) NULL , QuickRatio DECIMAL(8,3) NULL , LTDebetEquity DECIMAL(8,3) NULL , TotalDebetEquity DECIMAL(8,3) NULL,  GrossMargin VARCHAR(45) NULL , OperatingMargin VARCHAR(45) NULL , ProfitMargin VARCHAR(45) NULL , Earningsdate DATETIME NULL , Price DECIMAL(8,3) NULL , pChange VARCHAR(45) NULL , Volume INT(11) NULL , PRIMARY KEY (id) )"

	URL='http://www.finviz.com/export.ashx?v=161'
	
	
	 
	
	
	
	
	mysql -e "LOAD DATA LOCAL INFILE 'm_financial.csv' INTO TABLE m_financial FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  IGNORE 1 LINES (id, ticker, marketCap, DivdendYield, ReturnOnAssets, ReturnOnEquity, ReturnOnInvest, CurrentRatio, QuickRatio, LTDebetEquity, TotalDebetEquity, GrossMargin, OperatingMargin, ProfitMargin, Earningsdate, Price, pChange, Volume) "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	
