CREATE TABLE 테이블 (칼럼1 INTEGER);
ALTER TABLE 테이블 CHANGE 칼럼1 칼럼2 INTEGER;

drop class  테이블;
 
CREATE TABLE 테이블 (칼럼1 INTEGER);
ALTER TABLE 테이블 CHANGE 칼럼1 칼럼1 INTEGER NOT NULL;

drop class  테이블;
CREATE TABLE 테이블 (칼럼1 INTEGER);
ALTER TABLE 테이블 MODIFY 칼럼1 INTEGER NOT NULL;

drop class  테이블;

CREATE TABLE 테이블 (칼럼1 INT DEFAULT 1);
ALTER TABLE 테이블 MODIFY 칼럼1 BIGINT;

drop class  테이블;

CREATE TABLE 테이블 (칼럼1 INT DEFAULT 1);
ALTER TABLE 테이블 MODIFY 칼럼1 BIGINT DEFAULT 1;

drop class  테이블;