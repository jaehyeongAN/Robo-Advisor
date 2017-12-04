package spring.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.project.service.RetireService;
import spring.project.vo.RetireVO;
import spring.project.vo.XmlVO;

@Controller
public class RetireController {
	
	@Autowired
	RetireService retireService;
	
	@RequestMapping("/retire.do")
	public String retireInput(){
		
		return "retire/retireInput";
	}
	
	@RequestMapping("/retireCalc.do")
	public ModelAndView retireCalc(HttpServletRequest request, HttpServletResponse response)throws IOException{
		
		// retireInput.jsp로부터 넘어온 파라미터
		String name =  request.getParameter("name");
		int retireYear = Integer.parseInt(request.getParameter("retireYear"));
		int nowAge = Integer.parseInt(request.getParameter("nowAge"));
		int deathAge = Integer.parseInt(request.getParameter("deathAge"));
		int requireMoney = Integer.parseInt(request.getParameter("requireMoney"));
		int savedMoney = Integer.parseInt(request.getParameter("savedMoney"));
		int pension = Integer.parseInt(request.getParameter("pension"));
		int saveMoney = Integer.parseInt(request.getParameter("saveMoney"));
		double rate = Double.parseDouble(request.getParameter("rate"));
		
		RetireVO vo = new RetireVO();
		vo.setName(name);
		vo.setDeathAge(deathAge);
		vo.setNowAge(nowAge);
		vo.setPension(pension);
		vo.setRate(rate);
		vo.setRequireMoney(requireMoney);
		vo.setRetireYear(retireYear);
		vo.setSavedMoney(savedMoney);
		vo.setSaveMoney(saveMoney);
		
		vo = retireService.retire_calc(vo);
		// DB반영
		//retireService.retireInsert(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		
		// 상품추천
		XmlVO xmlvo = new XmlVO();
		List<XmlVO> xmlList = retireService.recommender();
		
		/*for(int i=0; i<xmlList.size(); i++){
			xmlvo = xmlList.get(i);
			System.out.println(xmlvo.getKor_co_nm());
			System.out.println(xmlvo.getFin_prdt_nm());
			System.out.println(xmlvo.getSale_strt_day());
			
		}*/
		
		
		mav.addObject("xmlList", xmlList);
		mav.setViewName("/retire/retireCalc");		// vo와 xmlList를 retireCalc로 넘김.
		
		return mav;
		
	}
	

}
