package spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.project.service.DispService;
import spring.project.service.FinnanceService;
import spring.project.vo.DispVO;
import spring.project.vo.MemberVO;
import spring.project.vo.MoneyVO;

@Controller
public class Finnance_Controller {

	@Autowired
	private FinnanceService finnanceService;
	// view page(url 요청) -> Controller -> Service
	
	@RequestMapping("/start.do")
	public String start(){
		
		return "consume/start";
	}
	
	@RequestMapping("/calc1.do")
	public ModelAndView calc1(MoneyVO vo){
		//int fixedIncome = vo.getFixedIncome();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		
		mav.setViewName("consume/start2");
		
		return mav;
	}
	
	@RequestMapping("/calc2.do")
	public ModelAndView calc2(MoneyVO vo){
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		
		mav.setViewName("consume/start3");
		
		return mav;
		
	}
	
	@RequestMapping("/calc3.do")
	public ModelAndView calc3(MoneyVO vo){
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",vo);
		
		mav.setViewName("consume/start4");
		
		return mav;
	}
	
	@RequestMapping("/calc4.do")
	public ModelAndView insert(MoneyVO vo) {
		DispVO dv = new DispVO();
		ModelAndView mav = new ModelAndView();
		this.finnanceService.insert(vo);
		DispService ds = new DispService();
		dv = ds.Display(vo);
		ds.saveExcel(vo, dv);

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
		mav.setViewName("consume/start5");

		return mav;

	}

}
