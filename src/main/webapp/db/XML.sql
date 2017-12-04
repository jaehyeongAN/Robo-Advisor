-- XML.sql
create table XML(
	fin_prdt_cd number(20) primary key,		-- 금융상품코드
	kor_co_nm varchar(30),							-- 금융회사
	fin_prdt_nm varchar(50),						-- 상품명
	sale_strt_day date,								-- 판매개시일
	mntn_cnt number(10),							-- 유지건수
	prdt_type_nm varchar(50),					-- 금리연동형
	avg_prft_rate number(10),						-- 판매 후 연평균 수익률
	dcls_rate number(10)							-- 공시이율
);

