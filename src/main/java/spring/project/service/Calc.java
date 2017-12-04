package spring.project.service;

import spring.project.vo.DispVO;
import spring.project.vo.MoneyVO;

public class Calc {

	static int Lev(int age, int income) {
		int lev;
		if (age < 30) { // 20대
			if (income >= 300) {
				lev = 1;
			} else {
				lev = 2;
			}
		} else if (age < 40 && age >= 30) { // 30대
			if (income >= 450) {
				lev = 1;
			} else {
				lev = 2;
			}
		} else if (age < 50 && age >= 40) { // 40대
			if (income >= 490) {
				lev = 1;
			} else {
				lev = 2;
			}
		} else { // 50대 이상
			if (income >= 500) {
				lev = 1;
			} else {
				lev = 2;
			}
		}
		return lev;
	}


	
	static MoneyVO expense_calc(int age, int lev){
		MoneyVO exp = new MoneyVO();
		
		if(lev == 1){
			if (age < 30) { // 20대
				exp.setFixedHome(33);
				exp.setFixedFood(55);
				exp.setFixedCommunication(13);
				exp.setFixedTrans(28);
				exp.setFixedInsurance(15);
				exp.setFixedTax(12);
				exp.setFixedExpense(156);

				exp.setFlucLife(6);
				exp.setFlucBeauty(17);
				exp.setFlucLeisure(11);
				exp.setFlucMedical(9);
				exp.setFlucEvent(10);
				exp.setFlueEtc(21);
				exp.setFlucEdu(7);
				exp.setFlucExpense(81);

				exp.setSumExpense(237);
			} else if (age < 40 && age >= 30) { // 30대
				exp.setFixedHome(27);
				exp.setFixedFood(68);
				exp.setFixedCommunication(15);
				exp.setFixedTrans(37);
				exp.setFixedInsurance(18);
				exp.setFixedTax(42);
				exp.setFixedExpense(207);

				exp.setFlucLife(14);
				exp.setFlucBeauty(21);
				exp.setFlucLeisure(15);
				exp.setFlucMedical(18);
				exp.setFlucEvent(16);
				exp.setFlueEtc(29);
				exp.setFlucEdu(22);
				exp.setFlucExpense(135);

				exp.setSumExpense(342);
			} else if (age < 50 && age >= 40) { // 40대
				exp.setFixedHome(26);
				exp.setFixedFood(78);
				exp.setFixedCommunication(17);
				exp.setFixedTrans(28);
				exp.setFixedInsurance(23);
				exp.setFixedTax(65);
				exp.setFixedExpense(237);

				exp.setFlucLife(11);
				exp.setFlucBeauty(22);
				exp.setFlucLeisure(17);
				exp.setFlucMedical(19);
				exp.setFlucEvent(17);
				exp.setFlueEtc(27);
				exp.setFlucEdu(49);
				exp.setFlucExpense(162);

				exp.setSumExpense(399);
			} else { // 50대 이상
				exp.setFixedHome(26);
				exp.setFixedFood(74);
				exp.setFixedCommunication(16);
				exp.setFixedTrans(37);
				exp.setFixedInsurance(22);
				exp.setFixedTax(66);
				exp.setFixedExpense(241);

				exp.setFlucLife(11);
				exp.setFlucBeauty(20);
				exp.setFlucLeisure(15);
				exp.setFlucMedical(17);
				exp.setFlucEvent(19);
				exp.setFlueEtc(28);
				exp.setFlucEdu(14);
				exp.setFlucExpense(124);

				exp.setSumExpense(365);
			}
		}else if(lev == 2){
			if (age < 30) { // 20대
				exp.setFixedHome(33);
				exp.setFixedFood(55);
				exp.setFixedCommunication(13);
				exp.setFixedTrans(28);
				exp.setFixedInsurance(15);
				exp.setFixedTax(12);
				exp.setFixedExpense(156);

				exp.setFlucLife(6);
				exp.setFlucBeauty(17);
				exp.setFlucLeisure(11);
				exp.setFlucMedical(9);
				exp.setFlucEvent(10);
				exp.setFlueEtc(21);
				exp.setFlucEdu(7);
				exp.setFlucExpense(81);

				exp.setSumExpense(237);
			} else if (age < 40 && age >= 30) { // 30대
				exp.setFixedHome(27);
				exp.setFixedFood(68);
				exp.setFixedCommunication(15);
				exp.setFixedTrans(37);
				exp.setFixedInsurance(18);
				exp.setFixedTax(42);
				exp.setFixedExpense(207);

				exp.setFlucLife(14);
				exp.setFlucBeauty(21);
				exp.setFlucLeisure(15);
				exp.setFlucMedical(18);
				exp.setFlucEvent(16);
				exp.setFlueEtc(29);
				exp.setFlucEdu(22);
				exp.setFlucExpense(135);

				exp.setSumExpense(342);
			} else if (age < 50 && age >= 40) { // 40대
				exp.setFixedHome(26);
				exp.setFixedFood(78);
				exp.setFixedCommunication(17);
				exp.setFixedTrans(28);
				exp.setFixedInsurance(23);
				exp.setFixedTax(65);
				exp.setFixedExpense(237);

				exp.setFlucLife(11);
				exp.setFlucBeauty(22);
				exp.setFlucLeisure(17);
				exp.setFlucMedical(19);
				exp.setFlucEvent(17);
				exp.setFlueEtc(27);
				exp.setFlucEdu(49);
				exp.setFlucExpense(162);

				exp.setSumExpense(399);
			} else { // 50대 이상
				exp.setFixedHome(26);
				exp.setFixedFood(74);
				exp.setFixedCommunication(16);
				exp.setFixedTrans(37);
				exp.setFixedInsurance(22);
				exp.setFixedTax(66);
				exp.setFixedExpense(241);

				exp.setFlucLife(11);
				exp.setFlucBeauty(20);
				exp.setFlucLeisure(15);
				exp.setFlucMedical(17);
				exp.setFlucEvent(19);
				exp.setFlueEtc(28);
				exp.setFlucEdu(14);
				exp.setFlucExpense(124);

				exp.setSumExpense(365);
			}
		}else{
			System.out.println("책정 실패");
		}
		
		
		return exp;
	}
	
	   static DispVO display(MoneyVO vo, MoneyVO exp){
		      DispVO dv = new DispVO();
		      System.out.println("--------출력화면--------");
		      System.out.println(vo.getId()+"의 소비 분석");
		      System.out.println("총 수입 : "+vo.getSumIncome());
		      System.out.println("총 지출 : "+vo.getSumExpense());
		      int diff = vo.getSumIncome()-vo.getSumExpense();
		      System.out.println("수지 차 : "+diff+"\n");
		         //수지차
		         if(diff<0){
		            System.out.println("수지차 : " + diff + " , 소비가 소득보다 많습니다.");
		            dv.setDiff( "수지차 : " + diff + " , 소득보다 소비가 많습니다.");
		         }else{
		            System.out.println("수지차 : " + diff + " , 소득이 소비보다 많습니다.");
		            dv.setDiff("수지차 : " + diff + " , 소득이 소비보다 많습니다.");
		            
		            //주거비용
		         }if(vo.getFixedHome() > exp.getFixedHome()){
		            System.out.println("주거비용 :  " +vo.getFixedHome() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFixedHome()+"만원 ");
		            dv.setFixedHome("주거비용 :  " +vo.getFixedHome() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFixedHome()+"만원 ");
		         }else{
		            System.out.println("주거비용 :  " +vo.getFixedHome() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFixedHome()+"만원 ");
		            dv.setFixedHome("주거비용 :  " +vo.getFixedHome() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFixedHome()+"만원 ");
		      //식비
		      }if(vo.getFixedFood() > exp.getFixedFood()){
		         System.out.println("식비 :  " +vo.getFixedFood() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFixedFood()+"만원 ");
		         dv.setFixedFood("식비 :  " +vo.getFixedFood() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFixedFood()+"만원 ");
		      }else{
		         System.out.println("식비 :  " +vo.getFixedFood() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFixedFood()+"만원 ");
		         dv.setFixedFood("식비 :  " +vo.getFixedFood() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFixedFood()+"만원 ");
		      //통신비
		      }if(vo.getFixedCommunication() > exp.getFixedCommunication()){
		         System.out.println("통신비 :  " +vo.getFixedCommunication() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFixedCommunication()+"만원 ");
		         dv.setCommunication("통신비 :  " +vo.getFixedCommunication() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFixedCommunication()+"만원 ");
		      }else{
		         System.out.println("통신비 :  " +vo.getFixedCommunication() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFixedCommunication()+"만원 ");
		         dv.setCommunication("통신비 :  " +vo.getFixedCommunication() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFixedCommunication()+"만원 ");
		      //교통비
		      }if(vo.getFixedTrans() > exp.getFixedTrans()){
		         System.out.println("교통비 :  " +vo.getFixedTrans() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFixedTrans()+"만원 ");
		         dv.setFixedTrans("교통비 :  " +vo.getFixedTrans() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFixedTrans()+"만원 ");
		      }else{
		         System.out.println("교통비 :  " +vo.getFixedTrans() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFixedTrans()+"만원 ");
		         dv.setFixedTrans("교통비 :  " +vo.getFixedTrans() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFixedTrans()+"만원 ");
		      //보험료
		      }if(vo.getFixedInsurance() > exp.getFixedInsurance()){
		         System.out.println("보험료 :  " +vo.getFixedInsurance() +"만원 "+ " > " + "동일 연령층 평균 비용  :" + exp.getFixedInsurance()+"만원 ");
		         dv.setFixedInsurance("보험료 :  " +vo.getFixedInsurance() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFixedInsurance()+"만원 ");
		      }else{
		         System.out.println("보험료 :  " +vo.getFixedInsurance() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFixedInsurance()+"만원 ");
		         dv.setFixedInsurance("보험료 :  " +vo.getFixedInsurance() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFixedInsurance()+"만원 ");
		      //세금
		      }if(vo.getFixedTax() > exp.getFixedTax()){
		    	  System.out.println("세금 :  " +vo.getFixedTax() +"만원 "+ " > " + "동일 연령층 평균 비용  :" + exp.getFixedTax()+"만원 ");
			      dv.setFixedTax("세금 :  " +vo.getFixedTax() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFixedTax()+"만원 ");
		      }else{
		    	  System.out.println("세금 :  " +vo.getFixedTax() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFixedTax()+"만원 ");
			      dv.setFixedTax("세금 :  " +vo.getFixedTax() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFixedTax()+"만원 ");
			  //생활용품비
		      }if(vo.getFlucLife() > exp.getFlucLife()){
		         System.out.println("생활용품비 :  " +vo.getFlucLife() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlucLife()+"만원 ");
		         dv.setFlucLife("생활용품비 :  " +vo.getFlucLife() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlucLife()+"만원 ");
		      }else{
		         System.out.println("생활용품비 :  " +vo.getFlucLife() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlucLife()+"만원 ");
		         dv.setFlucLife("생활용품비 :  " +vo.getFlucLife() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlucLife()+"만원 ");
		      //의류미용비
		      }if(vo.getFlucBeauty() > exp.getFlucBeauty()){
		         System.out.println("의류미용비 :  " +vo.getFlucBeauty() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlucBeauty()+"만원 ");
		         dv.setFlucBeauty("의류미용비 :  " +vo.getFlucBeauty() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlucBeauty()+"만원 ");
		      }else{
		         System.out.println("의류미용비 :  " +vo.getFlucBeauty() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlucBeauty()+"만원 ");
		         dv.setFlucBeauty("의류미용비 :  " +vo.getFlucBeauty() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlucBeauty()+"만원 ");
		      //문화레저비
		      }if(vo.getFlucLeisure() > exp.getFlucLeisure()){
		         System.out.println("문화레저비 :  " +vo.getFlucLeisure() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlucLeisure()+"만원 ");
		         dv.setFlucLeisure("문화레저비 :  " +vo.getFlucLeisure() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlucLeisure()+"만원 ");
		      }else{
		         System.out.println("문화레저비 :  " +vo.getFlucLeisure() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlucLeisure()+"만원 ");
		         dv.setFlucLeisure("문화레저비 :  " +vo.getFlucLeisure() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlucLeisure()+"만원 ");
		      //의료비
		      }if(vo.getFlucMedical() > exp.getFlucMedical()){
		         System.out.println("의료비 :  " +vo.getFlucMedical() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlucMedical()+"만원 ");
		         dv.setFlucMedical("의료비 :  " +vo.getFlucMedical() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlucMedical()+"만원 ");
		      }else{
		         System.out.println("의료비 :  " +vo.getFlucMedical() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlucMedical()+"만원 ");
		         dv.setFlucMedical("의료비 :  " +vo.getFlucMedical() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlucMedical()+"만원 ");
		      //경조사비
		      }if(vo.getFlucEvent() > exp.getFlucEvent()){
		         System.out.println("경조사비 :  " +vo.getFlucEvent() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlucEvent()+"만원 ");
		         dv.setFlucEvent("경조사비 :  " +vo.getFlucEvent() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlucEvent()+"만원 ");
		      }else{
		         System.out.println("경조사비 :  " +vo.getFlucEvent() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlucEvent()+"만원 ");
		         dv.setFlucEvent("경조사비 :  " +vo.getFlucEvent() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlucEvent()+"만원 ");
		      //기타비용
		      }if(vo.getFlueEtc() > exp.getFlueEtc()){
		         System.out.println("기타비용 :  " +vo.getFlueEtc() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlueEtc()+"만원 ");
		         dv.setFlueEtc("기타비용 :  " +vo.getFlueEtc() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlueEtc()+"만원 ");
		      }else{
		         System.out.println("기타비용 :  " +vo.getFlueEtc() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlueEtc()+"만원 ");
		         dv.setFlueEtc("기타비용 :  " +vo.getFlueEtc() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlueEtc()+"만원 ");
		      //교육비
		      }if(vo.getFlucEdu() > exp.getFlucEdu()){
		         System.out.println("교육비 :  " +vo.getFlucEdu() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlucEdu()+"만원 ");
		         dv.setFlucEdu("교육비 :  " +vo.getFlucEdu() +"만원 "+ " > " + "동일 연령층 평균 비용 : " + exp.getFlucEdu()+"만원 ");
		      }else{
		         System.out.println("교육비 :  " +vo.getFlucEdu() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlucEdu()+"만원 ");
		         dv.setFlucEdu("교육비 :  " +vo.getFlucEdu() +"만원 "+ " < " + "동일 연령층 평균 비용 : " + exp.getFlucEdu()+"만원 ");
		      }
		      return dv;
		   }

}
