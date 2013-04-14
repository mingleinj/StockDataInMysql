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
	

	`id` int(11) NOT NULL,
  `ticker` varchar(45) DEFAULT NULL,
  `perfWeek` decimal(8,3) DEFAULT NULL,
  `PerfMonth` decimal(8,3) DEFAULT NULL,
  `PerfQuart` decimal(8,3) DEFAULT NULL,
  `PerfHalf` decimal(8,3) DEFAULT NULL,
  `PerfYear` decimal(8,3) DEFAULT NULL,
  `PerfYTD` decimal(8,3) DEFAULT NULL,
  `VolatilityW` decimal(8,3) DEFAULT NULL,
  `VolatilityM` decimal(8,3) DEFAULT NULL,
  `Recom` decimal(8,3) DEFAULT NULL,
  `AvgVolume` decimal(8,3) DEFAULT NULL,
  `RelativeVolume` decimal(8,3) DEFAULT NULL,
  `price` decimal(8,3) DEFAULT NULL,
  `changes` decimal(8,3) DEFAULT NULL,
  `volume` int(11)
	
	mysql -e "LOAD DATA LOCAL INFILE 'finviz_performance.csv' INTO TABLE m_performance FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'  IGNORE 1 LINES (id, ticker, perfWeek, PerfMonth, PerfQuart, PEG, PS, PB, PC, PFCF, EPSthisYear, EPSnextYear, EPSpast5Year, EPSnext5Year, Salespast5Year, Price, changes, Volume) "  --local-infile -u ${USER} -h ${HOST} -p${PASS} -D ${DB};
	
	
