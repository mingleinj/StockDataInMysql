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
	CREATE="DROP TABLE IF EXISTS KeyBenchmark; CREATE TABLE KeyBenchmark (id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, parent_ID INT(11), description VARCHAR(60), OneDayPriceChange DECIMAL(8,3), MarketCap VARCHAR(40), pe DECIMAL(8,3), roe DECIMAL(8,3),  DivYield DECIMAL(8,3), LongDebtToEquity DECIMAL(8,3), PriceBookValue DECIMAL(8,3), NetProfitMargin DECIMAL(8,3), PriceToFreeCashFlow DECIMAL(8,3))"
	
	mysql -e "${CREATE//_SYMBOL_/$SYMBOL}" ${DB_PARAMS}
	 
	URL='http://biz.yahoo.com/p/csv/s_mktd.csv'
	
	curl -o "${TAB_PREFIX}_sector.csv" -L -q "${URL/_SYMBOL_/$SYMBOL}"
	
	mysql -e "LOAD DATA LOCAL INFILE '"${TAB_PREFIX}_sector.csv"' INTO TABLE KeyBenchmark FIELDS TERMINATED BY ','  ENCLOSED BY '\"'
	   LINES TERMINATED BY '\n'  IGNORE 1 LINES  (description , OneDayPriceChange, MarketCap, pe, roe,  DivYield, LongDebtToEquity, PriceBookValue, NetProfitMargin, PriceToFreeCashFlow)"  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	URL='http://biz.yahoo.com/p/csv/1mktd.csv'
	
	curl -o "${TAB_PREFIX}_ind1.csv" -L -q "${URL/_SYMBOL_/$SYMBOL}"
	
	mysql -e "LOAD DATA LOCAL INFILE '"${TAB_PREFIX}_ind1.csv"' INTO TABLE KeyBenchmark FIELDS TERMINATED BY ','  ENCLOSED BY '\"'
	   LINES TERMINATED BY '\n'  IGNORE 1 LINES  (description , OneDayPriceChange, MarketCap, pe, roe,  DivYield, LongDebtToEquity, PriceBookValue, NetProfitMargin, PriceToFreeCashFlow) set parent_ID= 1 "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	URL='http://biz.yahoo.com/p/csv/3mktd.csv'
	
	curl -o "${TAB_PREFIX}_ind3.csv" -L -q "${URL/_SYMBOL_/$SYMBOL}"
	
	mysql -e "LOAD DATA LOCAL INFILE '"${TAB_PREFIX}_ind3.csv"' INTO TABLE KeyBenchmark FIELDS TERMINATED BY ','  ENCLOSED BY '\"'
	   LINES TERMINATED BY '\n'  IGNORE 1 LINES  (description , OneDayPriceChange, MarketCap, pe, roe,  DivYield, LongDebtToEquity, PriceBookValue, NetProfitMargin, PriceToFreeCashFlow) set parent_ID= 3 "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	URL='http://biz.yahoo.com/p/csv/2mktd.csv'
	
	curl -o "${TAB_PREFIX}_ind2.csv" -L -q "${URL/_SYMBOL_/$SYMBOL}"
	
	mysql -e "LOAD DATA LOCAL INFILE '"${TAB_PREFIX}_ind2.csv"' INTO TABLE KeyBenchmark FIELDS TERMINATED BY ','  ENCLOSED BY '\"'
	   LINES TERMINATED BY '\n'  IGNORE 1 LINES  (description , OneDayPriceChange, MarketCap, pe, roe,  DivYield, LongDebtToEquity, PriceBookValue, NetProfitMargin, PriceToFreeCashFlow) set parent_ID= 2 "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	URL='http://biz.yahoo.com/p/csv/4mktd.csv'
	
	curl -o "${TAB_PREFIX}_ind4.csv" -L -q "${URL/_SYMBOL_/$SYMBOL}"
	
	mysql -e "LOAD DATA LOCAL INFILE '"${TAB_PREFIX}_ind4.csv"' INTO TABLE KeyBenchmark FIELDS TERMINATED BY ','  ENCLOSED BY '\"'
	   LINES TERMINATED BY '\n'  IGNORE 1 LINES  (description , OneDayPriceChange, MarketCap, pe, roe,  DivYield, LongDebtToEquity, PriceBookValue, NetProfitMargin, PriceToFreeCashFlow) set parent_ID= 4 "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	URL='http://biz.yahoo.com/p/csv/5mktd.csv'
	
	curl -o "${TAB_PREFIX}_ind5.csv" -L -q "${URL/_SYMBOL_/$SYMBOL}"
	
	mysql -e "LOAD DATA LOCAL INFILE '"${TAB_PREFIX}_ind5.csv"' INTO TABLE KeyBenchmark FIELDS TERMINATED BY ','  ENCLOSED BY '\"'
	   LINES TERMINATED BY '\n'  IGNORE 1 LINES  (description , OneDayPriceChange, MarketCap, pe, roe,  DivYield, LongDebtToEquity, PriceBookValue, NetProfitMargin, PriceToFreeCashFlow) set parent_ID= 5 "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	URL='http://biz.yahoo.com/p/csv/6mktd.csv'
	
	curl -o "${TAB_PREFIX}_ind6.csv" -L -q "${URL/_SYMBOL_/$SYMBOL}"
	
	mysql -e "LOAD DATA LOCAL INFILE '"${TAB_PREFIX}_ind6.csv"' INTO TABLE KeyBenchmark FIELDS TERMINATED BY ','  ENCLOSED BY '\"'
	   LINES TERMINATED BY '\n'  IGNORE 1 LINES  (description , OneDayPriceChange, MarketCap, pe, roe,  DivYield, LongDebtToEquity, PriceBookValue, NetProfitMargin, PriceToFreeCashFlow) set parent_ID= 6 "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	URL='http://biz.yahoo.com/p/csv/7mktd.csv'
	
	curl -o "${TAB_PREFIX}_ind7.csv" -L -q "${URL/_SYMBOL_/$SYMBOL}"
	
	mysql -e "LOAD DATA LOCAL INFILE '"${TAB_PREFIX}_ind7.csv"' INTO TABLE KeyBenchmark FIELDS TERMINATED BY ','  ENCLOSED BY '\"'
	   LINES TERMINATED BY '\n'  IGNORE 1 LINES  (description , OneDayPriceChange, MarketCap, pe, roe,  DivYield, LongDebtToEquity, PriceBookValue, NetProfitMargin, PriceToFreeCashFlow) set parent_ID= 7 "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	URL='http://biz.yahoo.com/p/csv/8mktd.csv'
	
	curl -o "${TAB_PREFIX}_ind8.csv" -L -q "${URL/_SYMBOL_/$SYMBOL}"
	
	mysql -e "LOAD DATA LOCAL INFILE '"${TAB_PREFIX}_ind8.csv"' INTO TABLE KeyBenchmark FIELDS TERMINATED BY ','  ENCLOSED BY '\"'
	   LINES TERMINATED BY '\n'  IGNORE 1 LINES  (description , OneDayPriceChange, MarketCap, pe, roe,  DivYield, LongDebtToEquity, PriceBookValue, NetProfitMargin, PriceToFreeCashFlow) set parent_ID= 8 "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	URL='http://biz.yahoo.com/p/csv/9mktd.csv'
	
	curl -o "${TAB_PREFIX}_ind9.csv" -L -q "${URL/_SYMBOL_/$SYMBOL}"
	
	mysql -e "LOAD DATA LOCAL INFILE '"${TAB_PREFIX}_ind9.csv"' INTO TABLE KeyBenchmark FIELDS TERMINATED BY ','  ENCLOSED BY '\"'
	   LINES TERMINATED BY '\n'  IGNORE 1 LINES  (description , OneDayPriceChange, MarketCap, pe, roe,  DivYield, LongDebtToEquity, PriceBookValue, NetProfitMargin, PriceToFreeCashFlow) set parent_ID= 9 "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	