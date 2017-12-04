--m_data

drop table m_data purge;

create table m_data(

id varchar(30),

age int,

fixedIncome int, --고정수입   

flucIncome int,--변동수입

sumIncome int,--수입합계

---------고정지출


fixedHome int,   --주거비용   

fixedFood int,      --식비      

fixedCommunication int, --통신비      

fixedTrans int, --교통비      

fixedInsurance int, --보험료      

fixedTax int, --세금      

fixedExpense int, --고정합계   

--------변동지출


flucLife int, --생활용품   

flucBeauty int, --의류미용   

flucLeisure int, --문화레저   

flucMedical int, --의료비      

flucEvent int, --경조사비   

flucEdu int,    -- 교육비

flueEtc int,      --기타비용   

flucExpense int,     --변동합계   

sumExpense int,     --지출 총합계

reg_date DATE

)

create sequence seq_data -- seqnum = 시퀀스명
start with 1                      -- 초기값 = 1
increment by 1                 -- 증가값 = 1

insert into m_data values('hong',30,100,100,100,100,100,100,100,100,100,100,100,100,100,100,100,50,100,100,100,sysdate)

select * from m_data
commit work