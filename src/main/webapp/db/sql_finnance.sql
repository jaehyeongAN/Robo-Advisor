
drop table retire;

create table retire(
   retireYear number(20) not null,      
   nowAge number(20) not null,   
   deathAge number(20) not null,      
   requireMoney number(20) not null,
   savedMoney number(20) not null,
   pension number(20) not null,   
   saveMoney number(20) not null,      
   rate number(20) not null,
   
   accMoney number(20),
   requireTotal number(20),
   totalMoney number(20),
   lackMoney number(20)
);

select * from retire;

drop table finnance_table purge;
create table finnance_table(
	code varchar2(10) not null,
	id varchar2(20) not null,
	nowAge number(2) not null,
	name varchar2(20) not null,
	gender number(1) not null,
	invest_tot number(10) not null,
	r_date date,
	f_type number(1),
	f_select number(1),
	goalMoney number(10),
	goalTime number(10),
	savedMoney number(10),
	positiveMoney number(10),
	requireTime number(10),
	shortageMoney number(10),
	surplusMoney number(10),
	requireMoney_m number(10),
	home_select number(1),
	home_region number(10),
	home_type number(10),
	home_m number(10),
	edu_n number(2),
	edu_1 number(2),
	edu_2 number(2),
	retire_p number(10),
	retire_pay number(10),
	retire_g number(1),
	etc_goal varchar2(30)
);

insert into finnance_table values('12345678', 'idid', 30, '집돌이', 1, 300, SYSDATE, 1, 1, 20000, 10, 5000, 150, 20, 5000, 0, 50, 1, 1, 2152, 109, null, 0, 0, 0, 0, null, 's');
insert into finnance_table values('12345678', 'idid', 30, '결혼돌이', 2, 300, sysdate, 2, 1, 8000, 3, 2000, 50, 3, 0, 100, 's')

select code, nowage,  goalMoney, savedmoney, goaltime, positivemoney from finnance_table where f_type = 0

select * from finnance_table order by f_type;
select * from finnance_table where code = '36010241' order by f_type;
create table testkk(
datee date,
intt number(2)
)
insert into testkk values(sysdate, 33)
drop table member purge;

create table member(
	id varchar2(30) primary key, -- 아이디
	pwd varchar2(20) not null, -- 비밀번호
	name varchar2(30) not null, -- 이름
	gender number(1) not null, -- 성별 남 : 1, 여 : 2
	address varchar2(50) not null, -- 주소
	birthDate char(6) not null, -- 생년월일
	phone char(11) not null,  -- 핸드폰 번호
	marriageCheck number not null, -- 기혼 : 1 미혼 : 2
	income number not null, -- 수입
	pay number not null, -- 지출
	myStyle number not null -- 위험 : 3 중간 : 2 안전: 1
);

insert into member values('jiayana','1234','박지연', 2,'서울 광진구 중곡4동', '890703', '01011112222', 2, 3500000, 1500000, 2);


select * from member;

commit work;

drop table recomm_w purge;
create table recomm_w(
	code varchar(20),
	invest_tot number,
	nowAge number,
	req_h number,
	req_m number,
	req_edu number,
	req_r number,
	req_etc number,
	fo_h number,
	fo_m number,
	fo_edu number,
	fo_r number,
	fo_etc number 
);
insert into RECOMM_W values('77778777',103, 29, 116, 140, 0, 28, 26, 0.3, 0.4, 0, 0.1, 0.2);
select * from RECOMM_W where code='56455474';
select count(*) from RECOMM_W
select count(*) from finnance_table





commit work