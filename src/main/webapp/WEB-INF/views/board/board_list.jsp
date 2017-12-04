<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="spring.project.dao.BoardDao" %>
<%@ page import="spring.project.vo.BoardVO" %>
<%@ page import="java.util.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
table.board_t {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    align : center;

}
table.board_t thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.board_t tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.board_t td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

</style>



<!-- Bootstrap Core CSS -->
<link href="../../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

</head>  

<body id="page-top">
	<%@ include file="/resources/include/headerBoard.jsp"%>

  
<%
    List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("list");
  // 게시판의 목록을 가져온다.
  // getBoardList()메소드는 BoardDAO 클래스에 목록을 가져올 수 있는 내용을 메소드를 작성한다.
%>
 <div id="board_wrap">  
  <table class="board_t" align="center" >

<!-- <tr>
        <td colspan="5" align="center">  
           <img src="../images/board.png" width="150">
        </td>
     </tr> -->

     <tr>
        <td colspan="4" align="center">  
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
           <td align="center"> <%=vo.getBoard_no() %></td>
           <td>
              <!-- 게시물 제목을 클릭하면 해당 게시물의 내용을 볼 수 있도록
               '*.do?no=글번호' 형태의 get 방식으로 글번호를 넘긴다. -->
               <a href="board_cont.do?board_no=<%=vo.getBoard_no()%>"
                 onfocus="this.blur()"> <%=vo.getBoard_title()%></a></td>
           
           <td> &nbsp; <%=vo.getBoard_name() %> &nbsp; </td>
           <td> &nbsp; <%=vo.getBoard_regdate().substring(0,10)%> &nbsp;</td>
            <!-- substring(0,10)은 등록날짜에서 앞자리 10개만 추출(날짜부분)-->
           
        </tr>
          <%
        	} // for end
          }else{
          %>
            <tr>
               <td colspan="4"> 게시물 목록이 없습니다.</td>
            </tr>
          <% } %>
          
      
      </table>
      	<br>
  		<input type="button" value="글쓰기"  id="resultInput"
            onclick="location='board_write.do'" 
            class="board_b"/>
       <!-- [글쓰기] 버튼을 클릭하면 board_write.jsp 파일로 이동된다. -->     
<!--        <script>
         function find_check(){
        	 if($.trim($("#find_name").val())==""){
        		 alert("검색어를 입력하세요.");
        		 $("#find_name").val("").focus();
        		 return false;
        	 }
         }
       </script>
       <div id="board_find">
         <form method="get" action="board_find_ok.do" onsubmit="return find_check()">
            <select name="find_field">
              <option value="board_title">제목</option>
              <option value="board_cont">내용</option>
            </select>
            <input name="find_name" id="find_name"
                   size="14"/>
            <input type="submit" value="검색" />       
         </form>
       </div>  -->    
    </div> 


<div class="clear"></div>
</body>

</html>