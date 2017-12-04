-- retire.sql

drop table retire purge

create table retire(
	id varchar(20) not null,
	regDate date not null,
	name varchar(20),
	retireYear number(20) not null,		
	nowAge number(20) not null,	
	deathAge number(20) not null,		
	requireMoney number(20) not null,
	savedMoney number(20) not null,
	pension number(20) not null,	
	saveMoney number(20) not null,		
	rate number(20) not null,
	
	retireAge number(20),
	accMoney number(20),
	requireTotal number(20),
	totalMoney number(20),
	lackMoney number(20),		-- 부족자금
	addMoney number(20),		-- 부족 자금을 위해 매달 저축해야하는 금액
	addMoney2 number(20),	-- 40% 대출받을 경우 
	addMoney3 number(20)		-- 60% 대출받을 경우
);

select * from retire;


select * from retire where regDate =
(select max(regDate) from retire)   

commit work;
