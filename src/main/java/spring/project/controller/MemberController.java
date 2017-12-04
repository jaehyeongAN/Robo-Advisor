package spring.project.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.project.service.MemberService;
import spring.project.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/main.do")
	public ModelAndView main(){
		List<MemberVO> list = this.memberService.selectMemberAll(); // list 반환
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("member/mainForm"); 
		return mav;
	}
	
	@RequestMapping("/selectMemberAll.do")
	public ModelAndView selectMemberAll(){
		
		List<MemberVO> list = this.memberService.selectMemberAll(); // list 반환
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("member/loginForm"); 
		return mav;
	}
	
	// index : login click
	@RequestMapping("/login.do")
	public String login(){
		List<MemberVO> list = this.memberService.selectMemberAll(); // list 반환
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		return "member/loginForm";
	}
	
	// index : logout click
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request,
			HttpServletResponse response){
		HttpSession session = request.getSession(false);
		
		Enumeration<?> attributeNames = session.getAttributeNames();
        while(attributeNames.hasMoreElements())
        {
            String attrName = (String)attributeNames.nextElement();

            if(session.getAttribute(attrName) != null)
            {
                session.setAttribute(attrName,null);
                //session.removeAttribute(attrName);
                attributeNames = session.getAttributeNames();
            }
        }
        // close session
        session.invalidate();
		
		return "member/mainForm"; 
	}
	
	// loginForm : 회원가입(join.do) click
	@RequestMapping("/join.do")
	public String join(){
		return "member/joinForm";
	}
	
	// loginForm : 로그인(login_ok.do) click
	@RequestMapping("login_ok.do")
	public ModelAndView login_ok(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws IOException{
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		
		MemberVO vo = new MemberVO();
		vo.setId(id); vo.setPwd(pwd);
		MemberVO vo2 = this.memberService.loginCheck(vo);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		ModelAndView mav=null;
		System.out.println("1qjs");
		if(vo2 != null){			
			mav = new ModelAndView();
			session.setAttribute("id", id); // 세션 생성
			
			session.setAttribute("name", vo2.getName());
			session.setAttribute("gender", vo2.getGender());
			session.setAttribute("birthDate", vo2.getBirthDate());
			session.setAttribute("income", vo2.getIncome());
			session.setAttribute("pay", vo2.getPay());
			
			String birthYear = "19"+((String)session.getAttribute("birthDate")).substring(0, 2); // 태어난 년도
			System.out.println(birthYear);
			int nowAge = 2017-Integer.parseInt(birthYear)+1; // 현재 나이
			
			session.setAttribute("nowAge", nowAge);
			mav.addObject("vo", vo2);
			mav.setViewName("member/mainForm"); 			
		}else{
			out.println("<script>");
			out.println("alert('회원정보를 다시 확인하세요.')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		}
		return mav; 
	}
	
	// joinForm : 회원가입 완료(join_ok.do) click
	@RequestMapping("/join_ok.do") 
	public String join_ok(HttpServletRequest request, 
			HttpServletResponse response, MemberVO vo) throws IOException{
				
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		this.memberService.insert(vo);
		out.println("<script>");
		out.println("alert('회원가입되었습니다.')");
		out.println("</script>");
		return "member/loginForm";
	}
	
	// joinForm : 중복아이디확인(idCheck_ok.do) click
	/*@RequestMapping("idCheck_ok.do")
	public ModelAndView idCheck_ok(HttpServletRequest request, 
			HttpServletResponse response) throws IOException{
		
		String id = request.getParameter("id");
		MemberVO vo = this.memberService.selectOne(id);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (vo != null) {
			out.println("<script>");
			out.println("alert('이미 존재하는 ID입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

	}*/
	
	// index : mypage(update.do) click
	/*@RequestMapping("/updateForm.do")
	public String updateForm(){
		return "member/updateForm";
	}*/
	
	
	
	/*// 다시 살릴거야!!!!!!!!!!!!
	@RequestMapping("/update.do")
	public ModelAndView update(String id) {

		MemberVO vo = this.memberService.selectOne(id);
		System.out.println(vo.getId());
		System.out.println(vo.getPwd());
		System.out.println(vo.getName());
		System.out.println(vo.getName());
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("member/updateForm");
		return mav;
	}*/

	
	
	// updateForm : 수정(update_ok.do) click
	@RequestMapping("/update_ok.do")
	public String update_ok(HttpServletRequest request, 
			HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String db_pwd = request.getParameter("db_pwd");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String address = request.getParameter("address");
		String birthDate = request.getParameter("birthDate"); 
		String phone = request.getParameter("phone"); 
		int marriageCheck = Integer.parseInt(request.getParameter("marriageCheck")); 
		// 기혼 : 1 미혼 : 2
		int income = Integer.parseInt(request.getParameter("income"));
		int pay = Integer.parseInt(request.getParameter("pay")); 
		int myStyle = Integer.parseInt(request.getParameter("myStyle")); 
		// 위험 : 3 중간 : 2 안전: 1

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (!pwd.equals(db_pwd)) {
			out.println("<script>");
			out.println("alert('비번이 틀립니다.')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		}

		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setGender(gender);
		vo.setAddress(address);
		vo.setBirthDate(birthDate);
		vo.setPhone(phone);
		vo.setMarriageCheck(marriageCheck);
		vo.setIncome(income);
		vo.setPay(pay);
		vo.setMyStyle(myStyle);

		this.memberService.update(vo);
		out.println("<script>");
		out.println("alert('수정되었습니다.')");
		out.println("location.href='main.do'");
		out.println("</script>");
		return null;
	}

	@RequestMapping("/delete.do")
	public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		this.memberService.delete(id);
		
		out.println("<script>");
		out.println("alert('회원 탈퇴하였습니다.')");
		out.println("location.href='main.do'");
		out.println("</script>");
	}

	
}












