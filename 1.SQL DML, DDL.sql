
-- 테이블(entity) 생성
-- 성적정보 저장CREATE 테이블

CREATE TABLE tbl_score (
	name varchar2(4) NOT NULL,
	kor NUMBER(3) NOT NULL CHECK(kor>0 AND kor <= 100),
	eng NUMBER(3) NOT NULL CHECK(eng>0 AND eng <= 100),
	math NUMBER(3) NOT NULL CHECK(math>0 AND math <= 100),
	total NUMBER(3) ,
	average NUMBER(5,2),
	grade char(1),
	stu_num number(6),
	-- PK 거는법
	CONSTRAINT pk_stu_num
	PRIMARY  KEY (stu_num)
);
-- 테이블 생성 후 PK 적용하기
ALTER TABLE tbl_score
ADD CONSTRAINT pk_stu_num
	PRIMARY KEY (stu_num);


-- 컬럼 추가하기
ALTER TABLE tbl_score ADD (sci NUMBER(3) NOT NULl);

-- 컬럼 제거하기
ALTER TABLE tbl_score DROP COLUMN sci;

-- 테이블 복사 (tb_emp)
-- CTAS
CREATE TABLE tb_emp_copy
AS SELECT * FROM tb_emp;

-- 복사 테이블 조회
SELECT * FROM tb_emp_copy;

-- drop table
DROP TABLE tb_emp_copy;

-- truncate table
-- 구조는 냅두고 내부 데이터만 전체 삭
TRUNCATE TABLE tb_emp_copy;



-- 예시 테이블
CREATE TABLE goods(
	id NUMBER(6) PRIMARY KEY,
	g_name varchar2(10) NOT NULL,
	price number(10) DEFAULT 1000,
	reg_date Date
);

SELECT * FROM goods;

-- INSERT
INSERT INTO 
	goods
	(id, g_name, price, reg_date)
values(1,'선풍기','120000',sysdate);

INSERT INTO 
	goods
	(id, g_name, reg_date)
values(2,'달고나',sysdate);

INSERT INTO 
	goods
	(id, g_name, price)
values(3,'후라이','120000');

-- 컬럼명 생략시 모든 컬럼에 대해 순서대로 넣어야함

INSERT INTO 
	goods
values(4,'하하',120000,sysdate);

--INSERT INTO goods
--	(g_name, id, price)
--	values('후리1',5,400),
--	values('후리2',6,400),
--	values('후리3',7,400);

SELECT * FROM goods;

-- 수정 UPDATE
UPDATE goods
SET g_name = '냉장고'
WHERE id = 3;

UPDATE goods
SET price = 9999

-- 행을 삭제 DELETE
DELETE FROM goods
WHERE id = 3;

-- select 조회
SELECT 
	certi_cd,
	certi_nm,
	issue_insti_nm
FROM tb_certi;

-- 중복제거 distinct
SELECT DISTINCT
	issue_insti_nm
FROM tb_certi
;

-- 모든 컬럼 조회
-- 실무에서는 사용 x
SELECT *
FROM tb_certi
;

-- select 조회
-- 열 별칭 부여
SELECT
	emp_nm AS 사원이름,
	addr 주소
FROM tb_emp
;

-- 문자열 연결하기
SELECT
	certi_nm || '(' || issue_insti_nm || ')' AS "자격증 정보"
FROM tb_certi
;