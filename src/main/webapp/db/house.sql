-- house.sql

create table house(
	id varchar(20) not null,
	regdate date not null,
	enterYear number(20) not null,		-- 예상 입주 시기
	requireMoney number(20) not null,	-- 목표 주거 금액
	saveMoney number(20) not null,		-- 월저축 가능 금액
	savedMoney number(20) not null,	-- 준비된 자금 
	rate number(20) not null,				-- 예상 수익률
	
	accMoney number(20),		-- 월 저축가능액으로 모을 수 있는 총자금
	totalMoney number(20),		-- 내가 모을 수 있는 금액
	lackMoney number(20),		-- 부족금액
	yearSave number(20),		-- 목표주거금액을 위해 저축해야하는 연 금액
	monthSave number(20),	--	목표주거금액을 위해 저축해야하는 월 금액
	addMoney number(20),		-- 부족 자금을 위해 매달 저축해야하는 금액
	addMoney2 number(20),	-- 40% 대출받을 경우 
	addMoney3 number(20),		-- 60% 대출받을 경우
	
	rpay_type_nm varchar(100),
	lend_rate_type_nm varchar(100),
	name varchar(20)
);

drop table house purge

select * from house;
select * from house where regdate =
(select max(regdate) from house)

create or replace view top5_hire_view
as
select empno,ename,sal,hiredate
from emp order by hiredate asc;


select *
from house
where rownum <= 5 orde;


commit work;

select * from house where regdate =
(select max(regdate) from house)