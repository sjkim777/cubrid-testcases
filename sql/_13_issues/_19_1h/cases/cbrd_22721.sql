drop if exists t;
CREATE TABLE t(a INT, b VARCHAR , c VARCHAR);
INSERT INTO t VALUES(1, '1', '1');
INSERT INTO t VALUES(2, '2', '2');
INSERT INTO t VALUES(3, '3', '3');
INSERT INTO t VALUES(4, 'null', 'NULL');
select if(benchmark(10,sum(a))>0, 'OK', 'NOK') from t;
select if(benchmark(10,avg(a))>0, 'OK', 'NOK') from t;
select if(benchmark(0,avg(a))>0, 'OK', 'NOK') from t;
select if(benchmark(-1,avg(a))>0, 'OK', 'NOK') from t;
select if(benchmark(10,now())>0, 'OK', 'NOK');
select if(benchmark(100,now())> benchmark(10,now()), 'OK', 'NOK');
select if(benchmark(10,json_object(b,c))>0, 'OK', 'NOK') from t;
select if(benchmark(10,json_array(b,c))>0, 'OK', 'NOK') from t;
select if(benchmark(10,json_quote(b))>0, 'OK', 'NOK') from t;
drop if exists t;
