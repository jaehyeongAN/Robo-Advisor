package spring.project.service;

import spring.project.vo.MemberVO;
import spring.project.vo.MoneyVO;
import spring.project.vo.MoneyVO2;
import spring.project.vo.SFVO;

public interface FinnanceService {
   
   void insert(MoneyVO vo); //삽입
   
   MoneyVO selectOne(String id);
   
   void update(MoneyVO vo);
   
   void delete(String id);
   
   void updatepay(MemberVO vo);
   
   MoneyVO selectResult(String id); 
   
   MoneyVO2 selectMoney2(String id);
   
   void insertMoney2(MoneyVO2 vo);
   
   

}
