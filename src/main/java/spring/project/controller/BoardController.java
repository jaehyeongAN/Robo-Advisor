package spring.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import spring.project.service.BoardService;

import spring.project.vo.BoardVO;


@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//board 리스트
	@RequestMapping("/board_list.do")
	public ModelAndView main(){
		List<BoardVO> list = this.boardService.boardList(); // list 반환
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("board/board_list"); 
		return mav;
	}
	

	
	//board 내용 보기
	@RequestMapping("/board_cont.do")
	public ModelAndView board_cont(int board_no){
		//System.out.println("Test");
		BoardVO vo = this.boardService.selectBoard(board_no);

		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("board/board_cont");
		return mav;
		
	}


	//board검색
	@RequestMapping("/board_find_ok.do")
	public ModelAndView find(String find_field, String find_name) {
		
		List<BoardVO> list = this.boardService.findBoard();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("find_name", find_name);
		mav.addObject("find_field",find_field);
		mav.setViewName("board/board_find");
		return mav;
	}
	
/*	@RequestMapping("/findBoard_ok.do")
	public ModelAndView selectOne_ok(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("controller영역");
		
		String find_name = request.getParameter("find_name");
		String find_field = request.getParameter("find_field");
		List<BoardVO> vo = this.boardService.findBoard(find_name, find_field );
		
		
		System.out.println("findBoard_ok.do 넘어옴");
		System.out.println("find_name=" + find_name);
		System.out.println("find_field=" + find_field);
		
		response.setCharacterEncoding("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if (vo != null) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("vo", vo);
			mav.addObject("find_field",find_field);
	    	mav.addObject("find_name", find_name);
	    	
			mav.setViewName("board/board_find");
			return mav;
		}else{
			out.println("<script>");
			out.println("alert('해당 사항이 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return null;
	}*/
	
/*	
	@RequestMapping("/board_find.do") // 게시판검색 
    public ModelAndView find(
    		@RequestParam("find_field") String find_field,
    		@RequestParam("find_name") String find_name){
    	
    	BoardVO vo = new BoardVO();
    	vo.put("find_field", find_field);
    	String find_name2 = "%"+find_name+"%";
    	map.put("find_name",find_name2);
    	
    	List<BoardVO> list = this.boardService.findBoard(find_name, find_field); // list 반환 
    	
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("list", list);
    	mav.addObject("find_field",find_field);
    	mav.addObject("find_name", find_name);
    	
    	mav.setViewName("user_find"); // views/user_find.jsp
    	
    	return mav;    	
    }*/
	
	
	//board 입력
	@RequestMapping("/board_write.do")
	public String insert() {
		
		return "board/board_write";  // board/board_write.jsp
	}
	
	@RequestMapping("/board_write_ok.do")
	public String insert_ok(BoardVO vo){
		
		//table에 레코드 삽입
		this.boardService.insert(vo);
		return "redirect:board_list.do";
	}
	
	
	@RequestMapping("/board_edit.do")
	public ModelAndView update(int board_no) {
		
		BoardVO vo = this.boardService.selectBoard(board_no);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("board/board_edit");
		return mav;
	}
	
	@RequestMapping("/board_edit_ok.do")
	public String update_ok(HttpServletRequest request, HttpServletResponse response)throws IOException{
		
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		String board_name = request.getParameter("board_name");
		String board_title = request.getParameter("board_title");
		String board_cont = request.getParameter("board_cont");
		String board_pwd = request.getParameter("board_pwd");
		String db_pwd = request.getParameter("db_pwd");
		
		
		// javascript 한글 처리
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if (!board_pwd.equals(db_pwd)) {
			out.println("<script>");
			out.println("alert('비번이 틀립니다.')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		}
		
		BoardVO vo = new BoardVO();
		vo.setBoard_no(board_no);
		vo.setBoard_name(board_name);
		vo.setBoard_title(board_title);
		vo.setBoard_cont(board_cont);
		vo.setBoard_pwd(board_pwd);
		
		this.boardService.update(vo);
		out.println("<script>");
		out.println("alert('수정되었습니다.')");
		out.println("location.href='board_list.do'");
		out.println("</script>");
		return null;
	}
	
	
	@RequestMapping("/board_delete.do")
	public ModelAndView board_delete(int board_no){
		//System.out.println("Test");
		BoardVO vo = this.boardService.selectBoard(board_no);

		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("board/board_delete");
		return mav;
		
	}

	@RequestMapping("/board_delete_ok.do")
	public void delete_ok(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		String board_pwd = request.getParameter("board_pwd");
		String del_pwd = request.getParameter("del_pwd");
		
		//System.out.println("board_pwd = "+board_pwd);
		//System.out.println("board_no = "+board_no);
		//System.out.println("del_pwd = "+del_pwd);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 사용자 비번과 db 비번 비교
		if (del_pwd.equals(board_pwd)) { // 비번 일치
			
			this.boardService.delete(board_no);
			
			out.println("<script>");
			out.println("alert('삭제 하였습니다.')");
			out.println("location.href='board_list.do'");
			out.println("</script>");
			
			
		} else { // 비번 불일치
			out.println("<script>");
			out.println("alert('비번이 틀립니다.')");
			out.println("history.back()");// 이전페이지 이동
			out.println("</script>");
		}

	
		
	}

	
}



