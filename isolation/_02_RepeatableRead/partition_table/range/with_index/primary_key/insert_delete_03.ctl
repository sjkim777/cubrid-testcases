/*
Test Case: delete & insert
Priority: 1
Reference case:
Author: Rong Xu

Test Point:
one user insert, another delete another partition

NUM_CLIENTS = 2
C1: insert(1)
C2: delete from t --blocked, can not see insert value
C1: commit
C2: commit
*/

MC: setup NUM_CLIENTS = 2;

C1: set transaction lock timeout INFINITE;
C1: set transaction isolation level repeatable read;

C2: set transaction lock timeout INFINITE;
C2: set transaction isolation level repeatable read;

/* preparation */
C1: drop table if exists t;
C1: create table t(id int,col varchar(10), primary key(id,col)) partition by range(id)(partition p1 values less than (10),partition p2 values less than (100));
C1: insert into t values(20,'abcd');
C1: commit work;
MC: wait until C1 ready;

/* test case */
C1: insert into t values(1,'abc');
C2: delete from t where id>10;
MC: wait until C1 ready;
MC: wait until C2 ready;

/* expect (1,'abc') (20,'abcd')*/
C1: select * from t order by 1;
MC: wait until C1 ready;
C1: commit work;

/* expect no value */
C2: select * from t order by 1;
MC: wait until C2 ready;
C2: commit;

/* expect (1,'abc') */
C2: select * from t order by 1;
C2: commit;

C2: quit;
C1: quit;

