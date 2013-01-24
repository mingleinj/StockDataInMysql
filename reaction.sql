select 
    close
from
    test.Pricehistory
where
    ticker = 'GE' and day = '2013-01-18';

select 
    close
from
    test.Pricehistory
where
    ticker = 'GE' and day = '2013-01-22';

select 
    avg(close)
from
    test.Pricehistory
where
    ticker = 'GE' 
and day <= '2013-01-18'
and day >= DATE_SUB('2013-01-18', INTERVAL 5 DAY);

select 
    MAX(close)
from
    test.Pricehistory
where
    ticker = 'GE' 
and day <= '2013-01-18'
and day >= DATE_SUB('2013-01-18', INTERVAL 5 DAY);


select 
    MIN(close)
from
    test.Pricehistory
where
    ticker = 'GE' 
and day <= '2013-01-18'
and day >= DATE_SUB('2013-01-18', INTERVAL 5 DAY);
     
        

