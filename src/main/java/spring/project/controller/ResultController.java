package spring.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.project.service.DispService;
import spring.project.service.FinnanceService;
import spring.project.service.HouseService;
import spring.project.service.RecommService;
import spring.project.service.RetireService;
import spring.project.service.RworkService;
import spring.project.service.SF_Service;
import spring.project.vo.DispVO;
import spring.project.vo.HouseVO;
import spring.project.vo.MemberVO;
import spring.project.vo.MoneyVO;
import spring.project.vo.RecommVO;
import spring.project.vo.RetireVO;
import spring.project.vo.SFVO;

@Controller
public class ResultController {
	
	@Autowired
	private RetireService retireService;
	@Autowired
	private HouseService houseService;
	@Autowired
	private FinnanceService finnanceService;
	@Autowired
	private SF_Service sF_service;

	@Autowired
	private RecommService recommservice;

	@Autowired
	private RworkService Rworkservice;
	
	
	//result/result_list
	@RequestMapping("/result_list.do")
	public ModelAndView retireResult(String id){	
		RetireVO rvo = this.retireService.selectRetire(id);
		HouseVO hvo = this.houseService.selectOne(id);
		SFVO svo = this.sF_service.selectSfvo(id);
		MoneyVO mvo = this.finnanceService.selectResult(id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rvo" , rvo);
		mav.addObject("hvo" , hvo);
		mav.addObject("svo", svo);
		mav.addObject("mvo", mvo);
		
		mav.setViewName("result/result_list");
		return mav;
	}
	
	//result/retireResult
	@RequestMapping("/retireResult.do")
	public ModelAndView retireView(String id){
		
		RetireVO vo = this.retireService.selectRetire(id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rvo", vo);
		mav.setViewName("result/retireResult");
		
		return mav;
		
	}
	
	//result/houseResult
	@RequestMapping("/houseResult.do")
	public ModelAndView houseView(String id){
		
		HouseVO vo = this.houseService.selectOne(id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("hvo", vo);
		mav.setViewName("result/houseResult");
		
		return mav;
	}
	
	 @RequestMapping("/dispResult.do")
	   public ModelAndView dispView(String id){
	      
	      MoneyVO vo = this.finnanceService.selectResult(id);
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("mvo", vo);
	      mav.setViewName("result/total_disp_exp");
	      
	      return mav;
	   }
	   
	   @RequestMapping("/anExpv.do")
	   public ModelAndView insert(MoneyVO vo,HttpSession session) {
	      DispVO dv = new DispVO();
	      ModelAndView mav = new ModelAndView();
	      DispService ds = new DispService();
	      dv = ds.Display(vo);
	      ds.saveExcel(vo, dv);

	      session.setAttribute("income", vo.getSumIncome());
	      session.setAttribute("pay", vo.getSumExpense());
	      
	      
	      MoneyVO exp = new MoneyVO();
	      exp = ds.Expen(vo);

	      MemberVO mvo = new MemberVO();
	      mvo.setId(vo.getId());
	      mvo.setPay(vo.getSumExpense());

	      mvo.setIncome(vo.getSumIncome());

	      this.finnanceService.updatepay(mvo);

	      mav.addObject("exp", exp);

	      mav.addObject("vo", vo);
	      mav.addObject("dv", dv);
	      mav.setViewName("result/total_analysis_exp");

	      return mav;

	   }
	   
	   @RequestMapping("/total_resultt.do")
	   public ModelAndView sf_consulting(SFVO vo, HttpServletRequest request, HttpServletResponse response)
	         throws IOException {
	      HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			vo = sF_service.selectSfvo(id);

			//재무 결과 계산
			List<SFVO> sf_result_list = sF_service.sf_select_result(vo.getCode());
			double [] w = sF_service.finn(vo.getNowAge());
			System.out.println("리스트랑 가중치 가져오기 성공");
			
			//real_goalMoney 배열
			int [] goalMoney_arr = new int[5];
			int [] real_goalMoney_arr = new int[5];
			int [] savedMoney_arr = new int[5];
			List<SFVO> new_sf_result_list = new ArrayList<SFVO>();
			
			for(int i=0; i<sf_result_list.size(); i++){
				SFVO vo1 = sf_result_list.get(i);
				if(vo1.getF_type()==0){
					goalMoney_arr[0]=vo1.getGoalMoney();
					savedMoney_arr[0] = vo1.getSavedMoney();
					real_goalMoney_arr[0] = goalMoney_arr[0]-savedMoney_arr[0];
					new_sf_result_list.add(0, vo1);
				}else if(vo1.getF_type()==1){
					goalMoney_arr[1]=vo1.getGoalMoney();
					savedMoney_arr[1] = vo1.getSavedMoney();
					real_goalMoney_arr[1] = goalMoney_arr[1]-savedMoney_arr[1];
					new_sf_result_list.add(1, vo1);
				}else if(vo1.getF_type()==2){
					goalMoney_arr[2]=vo1.getGoalMoney();
					savedMoney_arr[2] = vo1.getSavedMoney();
					real_goalMoney_arr[2] = goalMoney_arr[2]-savedMoney_arr[2];
					new_sf_result_list.add(2, vo1);
				}else if(vo1.getF_type()==3){
					goalMoney_arr[3]=vo1.getGoalMoney();
					savedMoney_arr[3] = vo1.getSavedMoney();
					real_goalMoney_arr[3] = goalMoney_arr[3]-savedMoney_arr[3];
					new_sf_result_list.add(3, vo1);
				}else if(vo1.getF_type()==4){
					goalMoney_arr[4]=vo1.getGoalMoney();
					savedMoney_arr[4] = vo1.getSavedMoney();
					real_goalMoney_arr[4] = goalMoney_arr[4]-savedMoney_arr[4];
					new_sf_result_list.add(4, vo1);
				}
			}
			System.out.println("real_goal배열 생성 성공");
			double w_sum = w[0]+w[1]+w[2]+w[3]+w[4];
			double cnt_w = 0;
			System.out.println("가중치 합 : "+w_sum);
			//가중치 수정
			for(int k=0; k<goalMoney_arr.length;k++){
				if(goalMoney_arr[k]==0){
					cnt_w +=w[k];
					w[k]=0;
				}
			}	
			
			
			for(int j=0; j<w.length;j++){
				w[j]=w[j]+w[j]*cnt_w;
			}
			
			
			/*System.out.println("첫번째 가중치 수정");
			System.out.println("집값 가중치"+w[0]);
			System.out.println("결혼 가중치"+w[1]);
			System.out.println("교육 가중치"+w[2]);
			System.out.println("은퇴 가중치"+w[3]);
			System.out.println("기타 가중치"+w[4]);*/
			
			//수익률 배열 구하기!
			double [] Rate_arr = new double[5];
			int [] goalTime_arr = new int[5];
			
				
			for(int i=0; i<sf_result_list.size(); i++){
				SFVO vo1 = sf_result_list.get(i);
				if(vo1.getF_type()==0){
					goalTime_arr[0] = vo1.getGoalTime();
				}else if(vo1.getF_type()==1){
					goalTime_arr[1] = vo1.getGoalTime();
				}else if(vo1.getF_type()==2){
					goalTime_arr[2] = vo1.getGoalTime();
				}else if(vo1.getF_type()==3){
					goalTime_arr[3] = vo1.getGoalTime();
				}else if(vo1.getF_type()==4){
					goalTime_arr[4] = vo1.getGoalTime();
				}
			}
			for(int i=0; i<goalTime_arr.length; i++){
				if(goalTime_arr[i]>=10){
					Rate_arr[i] = 0.05;
				}else if(goalTime_arr[i]>=3){
					Rate_arr[i] = 0.07;
				}else if(goalTime_arr[i]<3){
					Rate_arr[i] = 0.02;
				}
			}
			System.out.println("수익률 배열 생성");
			//positiveMoney 배열 구하기
			int [] positiveMoney_arr = new int[5];
			for(int i=0; i<positiveMoney_arr.length;i++){
				positiveMoney_arr[i] = (int)Math.round(w[i]*vo.getInvest_tot());
			}
			System.out.println("가능적립금 생성");
			// requireTime 배열구하기
			int [] requireTime_arr = new int[5];
			//집
			int p0 = positiveMoney_arr[0]*12;
			if(p0!=0){
				requireTime_arr[0] = sF_service.FV_my_year(p0, real_goalMoney_arr[0], Rate_arr[0]);
			}else{requireTime_arr[0]=0;}
			
			//결혼
			int p1 = positiveMoney_arr[1]*12;
			if(p1!=0){
				requireTime_arr[1] = sF_service.FV_my_year(p1, real_goalMoney_arr[1], Rate_arr[1]);
			}else{requireTime_arr[1]=0;}

			// 자녀교육
			int p2 = positiveMoney_arr[2]*12;
			if(p2!=0){
				requireTime_arr[2] = sF_service.FV_my_year(p2, real_goalMoney_arr[2], Rate_arr[2]);
			}else{requireTime_arr[2]=0;}

			//은퇴
			
			int p3 = positiveMoney_arr[3]*12;
			SFVO vo_retire = new_sf_result_list.get(3);
			if(vo_retire.getRetire_g()==1){
				real_goalMoney_arr[3] = (int)Math.round(sF_service.PV_a(vo_retire.getGoalTime(), 0.02)*(vo_retire.getRetire_p()-81)*12)-vo_retire.getSavedMoney();
			}
			if(p3!=0){
				requireTime_arr[3] = sF_service.FV_my_year(p3, real_goalMoney_arr[3], Rate_arr[3]);
			}else{requireTime_arr[3]=0;}

			//기타
			int p4 = positiveMoney_arr[4]*12;
			if(p4!=0){
				requireTime_arr[4] = sF_service.FV_my_year(p4, real_goalMoney_arr[4], Rate_arr[4]);
			}else{requireTime_arr[4]=0;}
			
			System.out.println("목표자금 내돈으로 만드는데 필요시간 계산 성공");
			
			//shortageMoney_arr 생성
			//surplusMoney_arr생성
			int [] shortageMoney_arr = new int[5];
			int [] surplusMoney_arr = new int[5];
			int [] myMoney_arr = new int[5];
			for(int i=0;i<5;i++){
				SFVO vo12 = new_sf_result_list.get(i);
				myMoney_arr[i] = (int)Math.round(12*positiveMoney_arr[i]*sF_service.FV_a(vo12.getGoalTime(), Rate_arr[i]));
				int pp = real_goalMoney_arr[i]-myMoney_arr[i];
				if(pp>0){
					shortageMoney_arr[i] = pp;
					surplusMoney_arr[i]=0;
				}else{
					shortageMoney_arr[i] = 0;
					surplusMoney_arr[i]=(-pp);
				}
			}
			
			System.out.println("부족자금 계산 성공");
			
			//requireMoney_m 생성
			int [] requireMoney_m_arr = new int[5];
			for(int i=0;i<5;i++){
				SFVO vo12 = new_sf_result_list.get(i);
				double p = real_goalMoney_arr[i]/(12*sF_service.FV_a(vo12.getGoalTime(), Rate_arr[i]));
				requireMoney_m_arr[i] = (int)Math.round(p);
			}
			
			System.out.println("매달 필요자금 배열 생성 완료");
			System.out.println("집값 필요자금 : "+requireMoney_m_arr[0]);
			System.out.println("결혼 필요자금 : "+requireMoney_m_arr[1]);
			System.out.println("교육 필요자금 : "+requireMoney_m_arr[2]);
			System.out.println("은퇴 필요자금 : "+requireMoney_m_arr[3]);
			System.out.println("기타 필요자금 : "+requireMoney_m_arr[4]);
			
			//계산 수정!!!!!
			int shortageMoney_sum =0;
			int surplusMoney_sum = 0;
			for(int i=0;i<5;i++){
				shortageMoney_sum +=shortageMoney_arr[i];
				surplusMoney_sum += surplusMoney_arr[i];
			}
			
			if(surplusMoney_sum>400){
				System.out.println("계산 수정 시작");
				System.out.println("부족자금 합계 : "+shortageMoney_sum);
				System.out.println("잉여자금 합계 : "+surplusMoney_sum);
				System.out.println("집값 남는돈 : "+surplusMoney_arr[0]);
				System.out.println("결혼 남는돈 : "+surplusMoney_arr[1]);
				System.out.println("교육 남는돈 : "+surplusMoney_arr[2]);
				System.out.println("은퇴 남는돈 : "+surplusMoney_arr[3]);
				
				//잉여자금이 많은경우 500이상
				if(surplusMoney_sum>500){
					// 남는 항목 월적립금 수정
					for(int i=0;i<5;i++){
						if(requireMoney_m_arr[i] < positiveMoney_arr[i]){
							positiveMoney_arr[i] = requireMoney_m_arr[i]+1;
						}
					}
					int positiveMoney_sum = 0;
					for(int ss : positiveMoney_arr){
						positiveMoney_sum +=ss;
					}
					
					int invest_tot2 = vo.getInvest_tot()-positiveMoney_sum;
					
					System.out.println(invest_tot2);
					//double [] cnt_ww = new double[5];
					
					String code1 = Rworkservice.Recomm_code(vo.getInvest_tot(),	vo.getNowAge(), 
							requireMoney_m_arr[0], requireMoney_m_arr[1], requireMoney_m_arr[2], requireMoney_m_arr[3], requireMoney_m_arr[4]);
					System.out.println("code : "+code1);
					
					w = recommservice.recomm_select_w(code1);
					/*
					//가중치 수정
					for(int k=0; k<surplusMoney_arr.length;k++){
						if(surplusMoney_arr[k]>100){
							System.out.println(requireMoney_m_arr[k]);
							System.out.println("---------------");
							System.out.println(vo.getInvest_tot());
							double aa = ((double)requireMoney_m_arr[k] / (double)vo.getInvest_tot()); 
							double sub = w[k]-aa;
							cnt_ww[k] = sub;
						}
					}
					System.out.println("cnt : "+cnt_ww[0]+","+cnt_ww[1]+","+cnt_ww[2]+","+cnt_ww[3]+","+cnt_ww[4]+",");
					double cnt_ww_sum = 0;
					for(double ss : cnt_ww){
						cnt_ww_sum += ss;
					}
					double sub_ww_sum = 0;
					for(int i = 0; i<cnt_ww.length ; i++){
						if(cnt_ww[i]==0){
							sub_ww_sum += w[i];
						}
					}
					
					if(sub_ww_sum==0){
						for(int j=0; j<surplusMoney_arr.length ; j++){
							if(surplusMoney_arr[j]>100){
								w[j] = ((double)requireMoney_m_arr[j] / (double)vo.getInvest_tot()); 
							}
							w[4] = cnt_ww_sum;
						}
					}else{
						for(int j=0; j<surplusMoney_arr.length ; j++){
							if(surplusMoney_arr[j]>100){
								w[j] = ((double)requireMoney_m_arr[j] / (double)vo.getInvest_tot()); 
							}else{
								w[j] = w[j] + w[j]*cnt_ww_sum/sub_ww_sum;
							}
						}
					}
					
					System.out.println("가중치 수정");
					System.out.println("w : "+w[0]+" , "+w[1]+" , "+w[2]+" , "+w[3]+" , "+w[4]);
					*/
					// 남는 잉여자금으로 월적립금 구하기
					for(int i=0; i<positiveMoney_arr.length;i++){
						positiveMoney_arr[i] = (int)Math.round(w[i]*vo.getInvest_tot());
					}
					
					// requireTime 배열구하기
					//집
					p0 = positiveMoney_arr[0]*12;
					if(p0!=0){
						requireTime_arr[0] = sF_service.FV_my_year(p0, real_goalMoney_arr[0], Rate_arr[0]);
					}else{requireTime_arr[0]=0;}
					
					//결혼
					 p1 = positiveMoney_arr[1]*12;
					if(p1!=0){
						requireTime_arr[1] = sF_service.FV_my_year(p1, real_goalMoney_arr[1], Rate_arr[1]);
					}else{requireTime_arr[1]=0;}

					// 자녀교육
					 p2 = positiveMoney_arr[2]*12;
					if(p2!=0){
						requireTime_arr[2] = sF_service.FV_my_year(p2, real_goalMoney_arr[2], Rate_arr[2]);
					}else{requireTime_arr[2]=0;}

					//은퇴
					 p3 = positiveMoney_arr[3]*12;
					 vo_retire = new_sf_result_list.get(3);
					if(vo_retire.getRetire_g()==1){
						real_goalMoney_arr[3] = (int)Math.round(sF_service.PV_a(vo_retire.getGoalTime(), 0.02)*(vo_retire.getRetire_p()-71)*12)-vo_retire.getSavedMoney();
					}
					if(p3!=0){
						requireTime_arr[3] = sF_service.FV_my_year(p3, real_goalMoney_arr[3], Rate_arr[3]);
					}else{requireTime_arr[3]=0;}

					//기타
					 p4 = positiveMoney_arr[4]*12;
					if(p4!=0){
						requireTime_arr[4] = sF_service.FV_my_year(p4, real_goalMoney_arr[4], Rate_arr[4]);
					}else{requireTime_arr[4]=0;}
					
					System.out.println("목표자금 내돈으로 만드는데 필요시간 계산 성공");
					
					//shortageMoney_arr 생성
					//surplusMoney_arr생성
					shortageMoney_arr = new int[5];
					surplusMoney_arr = new int[5];
					myMoney_arr = new int[5];
					for(int i=0;i<5;i++){
						SFVO vo12 = new_sf_result_list.get(i);
						myMoney_arr[i] = (int)Math.round(12*positiveMoney_arr[i]*sF_service.FV_a(vo12.getGoalTime(), Rate_arr[i]));
						int pp = real_goalMoney_arr[i]-myMoney_arr[i];
						if(pp>0){
							shortageMoney_arr[i] = pp;
							surplusMoney_arr[i]=0;
						}else{
							shortageMoney_arr[i] = 0;
							surplusMoney_arr[i]=(-pp);
						}
					}
					
				}
				System.out.println("한번 끝~~");
				for(int i=0;i<5;i++){
					shortageMoney_sum +=shortageMoney_arr[i];
					surplusMoney_sum += surplusMoney_arr[i];
				}
			}
			
			System.out.println("while의 시작");
			int cnt = 0;
			while(true){
				
				if((shortageMoney_sum<500 || surplusMoney_sum<500)||cnt>=200){
					System.out.println("부족자금 합계 : "+shortageMoney_sum);
					System.out.println("잉여자금 합계 : "+surplusMoney_sum);
					break;
				}else{
					cnt +=1;
					System.out.println("while 돌아 간다잉~~~~~~~~~~~");
					System.out.println("계산 수정 시작");
					System.out.println("부족자금 합계 : "+shortageMoney_sum);
					System.out.println("잉여자금 합계 : "+surplusMoney_sum);
					System.out.println("집값 남는돈 : "+surplusMoney_arr[0]);
					System.out.println("결혼 남는돈 : "+surplusMoney_arr[1]);
					System.out.println("교육 남는돈 : "+surplusMoney_arr[2]);
					System.out.println("은퇴 남는돈 : "+surplusMoney_arr[3]);
					//잉여자금이 많은경우 500이상
					if(surplusMoney_sum>500){
						// 남는 항목 월적립금 수정
						for(int i=0;i<5;i++){
							if(requireMoney_m_arr[i] < positiveMoney_arr[i]){
								positiveMoney_arr[i] = requireMoney_m_arr[i]+1;
							}
						}
						int positiveMoney_sum = 0;
						for(int ss : positiveMoney_arr){
							positiveMoney_sum +=ss;
						}
						
						int invest_tot2 = vo.getInvest_tot()-positiveMoney_sum;
						
						System.out.println(invest_tot2);
						
						//가중치 수정
						double [] cnt_ww = new double[5];
						for(int k=0; k<surplusMoney_arr.length;k++){
							if(surplusMoney_arr[k]>100){
								System.out.println(requireMoney_m_arr[k]);
								System.out.println("---------------");
								System.out.println(vo.getInvest_tot());
								double aa = ((double)requireMoney_m_arr[k] / (double)vo.getInvest_tot()); 
								double sub = w[k]-aa;
								cnt_ww[k] = sub;
							}
						}
						System.out.println("cnt : "+cnt_ww[0]+","+cnt_ww[1]+","+cnt_ww[2]+","+cnt_ww[3]+","+cnt_ww[4]+",");
						double cnt_ww_sum = 0;
						for(double ss : cnt_ww){
							cnt_ww_sum += ss;
						}
						double sub_ww_sum = 0;
						for(int i = 0; i<cnt_ww.length ; i++){
							if(cnt_ww[i]==0){
								sub_ww_sum += w[i];
							}
						}
						System.out.println("invest : "+vo.getInvest_tot());
						if(sub_ww_sum==0){
							for(int j=0; j<surplusMoney_arr.length ; j++){
								if(surplusMoney_arr[j]>100){
									w[j] = ((double)requireMoney_m_arr[j] / (double)vo.getInvest_tot()); 
								}
								w[4] = cnt_ww_sum;
							}
						}else{
							for(int j=0; j<surplusMoney_arr.length ; j++){
								if(surplusMoney_arr[j]>100){
									w[j] = ((double)requireMoney_m_arr[j] / (double)vo.getInvest_tot()); 
								}else{
									w[j] = w[j] + w[j]*cnt_ww_sum/sub_ww_sum;
								}
							}
						}
						
						
						
						System.out.println("가중치 수정");
						System.out.println("w : "+w[0]+" , "+w[1]+" , "+w[2]+" , "+w[3]+" , "+w[4]);
						// 남는 잉여자금으로 월적립금 구하기
						for(int i=0; i<positiveMoney_arr.length;i++){
							positiveMoney_arr[i] = (int)Math.round(w[i]*vo.getInvest_tot());
						}
						
						// requireTime 배열구하기
						//집
						p0 = positiveMoney_arr[0]*12;
						if(p0!=0){
							requireTime_arr[0] = sF_service.FV_my_year(p0, real_goalMoney_arr[0], Rate_arr[0]);
						}else{requireTime_arr[0]=0;}
						
						//결혼
						 p1 = positiveMoney_arr[1]*12;
						if(p1!=0){
							requireTime_arr[1] = sF_service.FV_my_year(p1, real_goalMoney_arr[1], Rate_arr[1]);
						}else{requireTime_arr[1]=0;}

						// 자녀교육
						 p2 = positiveMoney_arr[2]*12;
						if(p2!=0){
							requireTime_arr[2] = sF_service.FV_my_year(p2, real_goalMoney_arr[2], Rate_arr[2]);
						}else{requireTime_arr[2]=0;}

						//은퇴
						 p3 = positiveMoney_arr[3]*12;
						 vo_retire = new_sf_result_list.get(3);
						if(vo_retire.getRetire_g()==1){
							real_goalMoney_arr[3] = (int)Math.round(sF_service.PV_a(vo_retire.getGoalTime(), 0.02)*(vo_retire.getRetire_p()-71)*12)-vo_retire.getSavedMoney();
						}
						if(p3!=0){
							requireTime_arr[3] = sF_service.FV_my_year(p3, real_goalMoney_arr[3], Rate_arr[3]);
						}else{requireTime_arr[3]=0;}

						//기타
						 p4 = positiveMoney_arr[4]*12;
						if(p4!=0){
							requireTime_arr[4] = sF_service.FV_my_year(p4, real_goalMoney_arr[4], Rate_arr[4]);
						}else{requireTime_arr[4]=0;}
						
						System.out.println("목표자금 내돈으로 만드는데 필요시간 계산 성공");
						
						//shortageMoney_arr 생성
						//surplusMoney_arr생성
						shortageMoney_arr = new int[5];
						surplusMoney_arr = new int[5];
						myMoney_arr = new int[5];
						for(int i=0;i<5;i++){
							SFVO vo12 = new_sf_result_list.get(i);
							myMoney_arr[i] = (int)Math.round(12*positiveMoney_arr[i]*sF_service.FV_a(vo12.getGoalTime(), Rate_arr[i]));
							int pp = real_goalMoney_arr[i]-myMoney_arr[i];
							if(pp>0){
								shortageMoney_arr[i] = pp;
								surplusMoney_arr[i]=0;
							}else{
								shortageMoney_arr[i] = 0;
								surplusMoney_arr[i]=(-pp);
							}
						}
						
					}
					System.out.println("한번 끝~~");
					for(int i=0;i<5;i++){
						shortageMoney_sum +=shortageMoney_arr[i];
						surplusMoney_sum += surplusMoney_arr[i];
					}
				} // else 끝
				
			}//while 끝
			System.out.println("while 끝");
			
			
			/*int shortageMoney_sum =0;
			int surplusMoney_sum = 0;
			for(int i=0;i<5;i++){
				shortageMoney_sum +=shortageMoney_arr[i];
				surplusMoney_sum += surplusMoney_arr[i];
			}
			
			
			while(!(shortageMoney_sum<500 || surplusMoney_sum <500)){
				
			}*/
			
			//보험료 계산
			int insurance_p = (int)Math.round((vo.getInvest_tot()/0.9)*0.1); 
			System.out.println("보험료 계산 성공");
			//list 수정
			// db 수정
			/*for(int i=0;i<5;i++){
				new_sf_result_list.get(i).setPositiveMoney(positiveMoney_arr[i]);
				new_sf_result_list.get(i).setRequireTime(requireTime_arr[i]);
				new_sf_result_list.get(i).setShortageMoney(shortageMoney_arr[i]);
				new_sf_result_list.get(i).setSurplusMoney(surplusMoney_arr[i]);
				new_sf_result_list.get(i).setRequireMoney_m(requireMoney_m_arr[i]);
				sF_service.sf_update(new_sf_result_list.get(i));
			}*/
			//System.out.println("디비 반영 성공!!");
			//포트폴리오 계산
			int [] portfolio = new int[5];
			portfolio[4]=insurance_p;
			for(int i=0;i<5;i++){
				SFVO vop = new_sf_result_list.get(i);
				if(Rate_arr[i]==0.02){
					portfolio[1]+=vop.getPositiveMoney();
				}else if(Rate_arr[i]==0.07){
					portfolio[2]+=vop.getPositiveMoney();
				}else if(Rate_arr[i]==0.05){
					portfolio[3]+=vop.getPositiveMoney();
				}
			}
			int income = (Integer)session.getAttribute("income");
			
			portfolio[0]= income-portfolio[1]-portfolio[2]-portfolio[3]-portfolio[4];
			//portfolio_test
			int [] portfolio_test = new int[3];
			portfolio_test[0] = portfolio[2];
			portfolio_test[1] = (int)Math.round(portfolio[3]*0.7)+portfolio[4];
			portfolio_test[2] = portfolio[1]+(int)Math.round(portfolio[2]*0.4)+(int)Math.round(portfolio[0]*0.3);

			/*
			RecommVO re_vo = new RecommVO();
			re_vo.setCode(vo.getCode());
			re_vo.setInvest_tot(vo.getInvest_tot());
			re_vo.setNowAge(vo.getNowAge());
			re_vo.setReq_h(requireMoney_m_arr[0]);re_vo.setReq_m(requireMoney_m_arr[1]);re_vo.setReq_edu(requireMoney_m_arr[2]);
			re_vo.setReq_r(requireMoney_m_arr[3]);re_vo.setReq_etc(requireMoney_m_arr[4]);
			re_vo.setFo_h(w[0]);re_vo.setFo_m(w[1]);re_vo.setFo_edu(w[2]);
			re_vo.setFo_r(w[3]);re_vo.setFo_etc(w[4]);
			System.out.println("--------값들어갔는지 테스트---------");
			
			System.out.println("code : "+re_vo.getCode());
			System.out.println("invest : "+re_vo.getInvest_tot());
			System.out.println("nowAge"+re_vo.getNowAge());
			System.out.println("require : "+re_vo.getReq_h()+" , "+re_vo.getReq_m()+" , "+re_vo.getReq_edu()+" , "+re_vo.getReq_r()+" , "+re_vo.getReq_etc());
			System.out.println("w : "+re_vo.getFo_h()+" , "+re_vo.getFo_m()+" , "+re_vo.getFo_edu()+" , "+re_vo.getFo_r()+" , "+re_vo.getFo_etc());
			*/
			//recommservice.recomm_insert(re_vo);
			
			//recommservice.WriteCSV2();
			
			//Rworkservice.Recomm_code(vo.getInvest_tot(),	vo.getNowAge(), 
			//		requireMoney_m_arr[0], requireMoney_m_arr[1], requireMoney_m_arr[2], requireMoney_m_arr[3], requireMoney_m_arr[4]);
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("vo_h",new_sf_result_list.get(0));
			mav.addObject("vo_m",new_sf_result_list.get(1));
			mav.addObject("vo_edu",new_sf_result_list.get(2));
			mav.addObject("vo_r",new_sf_result_list.get(3));
			mav.addObject("vo_etc",new_sf_result_list.get(4));
			mav.addObject("insurance_p",insurance_p);
			mav.addObject("portfolio",portfolio);
			mav.addObject("portfolio_test",portfolio_test);
			
			mav.setViewName("result/total_result");
			//mav.setViewName("sf_consulting2/consulting_trainmake");
			System.out.println("값들 다음 페이지 넘기는거 성공");
			return mav;
	   }


	   

	
	
	//my page
	@RequestMapping("/update.do")
	public ModelAndView mypage(String id){	
		List<SFVO> svo = this.sF_service.sfvoResultList(id);
		
		for(int i=0; i<svo.size();i++){
			SFVO vo = svo.get(i);
			//System.out.println(i);
			//System.out.println(vo.getCode()+vo.getEdu_1()+vo.getNowAge());
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("svo" , svo);
		
		mav.setViewName("member/updateForm");
		return mav;
		
	}
	
	
	@RequestMapping("/result_main.do")
	public String sf_main() {

		return "member/mainForm";
	}
	
	
	
	
	
	
	
	

}
