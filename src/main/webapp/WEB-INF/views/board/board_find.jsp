<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="spring.project.vo.BoardVO" %>

<%@ page import="java.util.*" %>
<!--  컬렉션 클래스를 사용하기 위해서 임포트 시킴 -->

<!--  ../ 한 단계 상위 폴더로 이동, 외부 포함 파일을 읽어오는 jsp 형식  -->

<div class="clear"></div>

 <div id="article">

  
  <div id="article_c">
    <%
    List<BoardVO> boardList = 
         (List<BoardVO>)request.getAttribute("vo");
  // 게시판의 목록을 가져온다.
  // getBoardList()메소드는 BoardDAO 클래스에 목록을 가져올 수
  // 있는 내용을 메소드를 작성한다.
%>
 <div id="board_wrap">  
  <table id="board_t">
     <tr>
        <td colspan="5" align="center">  
            <img src="./images/board.png" width="160">
        </td>
     </tr>
     <tr>
        <td colspan="5" align="center">  
            &nbsp;
        </td>
     </tr>
     <tr>
        <th> 글번호 </th> <th> 제목 </th>
        <th> 글쓴이 </th> <th> 등록날짜 </th>
        
     </tr>
     <%
        if((boardList != null) && (boardList.size()>0 )){
        	// 게시판의 목록이 1개 이상 존재하는 경우 조건은 참이 된다.
        	for(int i=0; i<boardList.size(); i++){
        		BoardVO vo = boardList.get(i);
        		// 컬렉션 요소값을 BoardBean 타입으로 가져온다.
     %>
        <tr>
           <!-- 게시판 번호 표시 -->
           <td> <%=vo.getBoard_no() %></td>
           <td>
               <a href="board_cont.do?board_no=<%=vo.getBoard_no()%>"
                 onfocus="this.blur()"> 
               <%=vo.getBoard_title()%></a></td>
           <td> <%=vo.getBoard_name() %></td>
           <td> <%=vo.getBoard_regdate().substring(0,10)%></td>
           
          </tr>
          <%
        	} // for end
          }else{
          %>
            <tr>
               <td colspan="5"> 게시물 목록이 없습니다.</td>
            </tr>
          <% } %>
      </table>
  		<input type="button" value="글쓰기" 
            onclick="location='board_write.do'" 
            class="board_b"/>
       <!-- [글쓰기] 버튼을 클릭하면 board_write.jsp 파일로 이동된다. -->     
       <script>
         function find_check(){
        	 if($.trim($("#find_name").val())==""){
        		 alert("검색어를 입력하세요.");
        		 $("#find_name").val("").focus();
        		 return false;
        	 }
         }
       </script>
       <div id="board_find">
         <form method="get" action="board_find_ok.do"
               onsubmit="return find_check()">
            <select name="find_field">
              <option value="board_title">제목</option>
              <option value="board_cont">내용</option>
            </select>
            <input name="find_name" id="find_name"
                   size="14"/>
            <input type="submit" value="검색" />
            <input type="button" value="목록" 
                   onclick="location='board_list.do'"/>       
         </form>
       </div>     
    </div> 
  </div>
</div>

<div class="clear"></div>
