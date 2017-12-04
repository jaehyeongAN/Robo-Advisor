--m_data

drop table m_data2 purge;

create table m_data2(

id varchar(30),

--현금성자산
money int, --현금

mmf int, --MMF  

ordinaryDeposits int, --보통예금    

savingsDeposits int,--저축예금 

--투자자산


fixedDeposit int,   --정기예금(목돈)   

bondFund int,      --채권형       

--펀드

stockFund  int, --주식형펀드       

realEstate int, --부동산       

realEstateFund  int, --부동산펀드       

apartmentApplication  int, --주택청약(집)      


--------은퇴자산


personalAnnuitySavings int, --개인연금저축    

insurance int, --보험    

variableAnnuities int, --변액연금보험    

variableUniversalInsurance  int, --변액유니버셜보험

reg_date DATE

);

select * from m_data2;
commit work;