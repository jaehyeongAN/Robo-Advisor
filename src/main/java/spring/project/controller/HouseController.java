package spring.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.project.service.HouseService;
import spring.project.service.TimeSeriesService;
import spring.project.vo.HouseVO;
import spring.project.vo.XmlVO2;

@Controller
public class HouseController {
	
	@Autowired
	HouseService houseService;
	
	@Autowired
	TimeSeriesService timeSeries;
	
	@RequestMapping("/house.do")
	public String houseInput(){
		
		return "house/houseInput";
	}
	
	@RequestMapping("/houseCalc.do")
	public ModelAndView houseCalc(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String name = request.getParameter("name");
		int enterYear = Integer.parseInt(request.getParameter("enterYear"));
		int requireMoney = Integer.parseInt(request.getParameter("requireMoney"));
		int savedMoney = Integer.parseInt(request.getParameter("savedMoney"));
		int saveMoney = Integer.parseInt(request.getParameter("saveMoney"));
		double rate = Double.parseDouble(request.getParameter("rate"));
	
		String rpay_type_nm = request.getParameter("rpay_type_nm");
		String lend_rate_type_nm = request.getParameter("lend_rate_type_nm");
		
		HouseVO vo = new HouseVO();
		vo.setName(name);
		vo.setEnterYear(enterYear);
		vo.setRate(rate);
		vo.setSavedMoney(savedMoney);
		vo.setSaveMoney(saveMoney);
		vo.setRequireMoney(requireMoney);
		vo.setRpay_type_nm(rpay_type_nm);
		vo.setLend_rate_type_nm(lend_rate_type_nm);
		
		vo = houseService.house_calc(vo);
		
		//this.houseService.insert(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		
		// 상품추천
		XmlVO2 xmlvo2 = new XmlVO2();
		List<XmlVO2> xmlList = houseService.recommender();
		
		
		mav.addObject("xmlList",xmlList);
		mav.setViewName("/house/houseCalc");
		
		return mav;
	}
	
	@RequestMapping("/time.do")
	public ModelAndView TimeCalc(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String add = request.getParameter("add");
		System.out.println("@@@@@@@"+add);
		String type = request.getParameter("type");
		String jugeao = request.getParameter("jugeao");
		int peongsu = Integer.parseInt(request.getParameter("peongsu"));
		int inputyear = Integer.parseInt(request.getParameter("enterYear"));
		
		String name = request.getParameter("name");
		int enterYear = Integer.parseInt(request.getParameter("enterYear"));
		
		enterYear = inputyear+2017;
		HouseVO vo = new HouseVO();
		vo.setName(name);
		vo.setEnterYear(enterYear);
		
		List<Integer> value = timeSeries.TimeSeriesValue(type, add, jugeao, peongsu, inputyear);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.addObject("enterYear", enterYear);
		mav.addObject("value", value);
		mav.setViewName("/house/houseInput2");
		
		return mav;
	
	
	}

}
