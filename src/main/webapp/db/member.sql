
drop table member purge;

create table member(
	id varchar2(30) primary key, -- 아이디
	pwd varchar2(20) not null, -- 비밀번호
	name varchar2(30) not null, -- 이름
	gender number not null, -- 성별 남 : 1, 여 : 2
	address varchar2(50) not null, -- 주소
	birthDate char(6) not null, -- 생년월일
	phone char(11) not null,  -- 핸드폰 번호
	marriageCheck number not null, -- 기혼 : 1 미혼 : 2
	income number not null, -- 수입
	pay number not null, -- 지출
	myStyle number not null -- 위험 : 3 중간 : 2 안전: 1
);

insert into member values('jy1234','1234','박지연', 2,'서울 광진구 중곡4동', '890703', '01011112222', 2, 3500000, 1500000, 2);
insert into member values('sungdae','1234','뽀로로', 2,'서울 광진구 중곡4동', '890703', '01011112222', 2, 3500000, 1500000, 2);

select * from member;

commit work;
