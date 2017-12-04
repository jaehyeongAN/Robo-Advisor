<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="spring.project.vo.BoardVO" %>
<%@ page import="java.util.*" %>

 <%
 	//setAttribute()메소드로 저장된 키 값을 가져온다.
 	//vo 키에는 수정을 위한 레코드 정보가 들어있다.
 	BoardVO vo = (BoardVO)request.getAttribute("vo");
 %>

<head>

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

 <script>
 function board_check(){
		if($.trim($("#board_name").val())==""){
			alert("글쓴이를 입력하세요.");
			$("#board_name").val("").focus();
			return false;
		}
		if($.trim($("#board_title").val())==""){
			alert("글 제목을 입력하세요.");
			$("#board_title").val("").focus();
			return false;
		}
		if($.trim($("#board_cont").val())==""){
			alert("글 내용을 입력하세요.");
			$("#board_cont").val("").focus();
			return false;
		}
		if($.trim($("#board_pwd").val())==""){
			alert("비밀번호를 입력하세요.");
			$("#board_pwd").val("").focus();
			return false;
		}
		  
	      
	}
 
 </script>
 
</head>  
 
<body id="page-top">
	<%@ include file="/resources/include/headerBoard.jsp"%> 
  
 <div id="boardwrite_wrap">
 <h2 class="boardwrite_title">게시물 수정 </h2>
 <form method="post" action="board_edit_ok.do"
       onsubmit="return board_check()"> 
 <!-- 히든타입으로 글번호와 비밀번호를 넘긴다.
         히든은 웹 상에서 안보이게 하는 역할을 한다. 값이 보이지 않게 넘길때 사용됨-->

 <input type="hidden" name="db_pwd" value="<%=vo.getBoard_pwd()%>"/>
 <table class="board_t" align="center">
    <tr>
    	<th> 글번호 </th>
    	<td> <input type="text" name="board_no" id="board_no"
    		  class="input_box" size="14" value="${vo.board_no}" readonly="readonly"/>
    </tr>
    
    <tr>
       <th> 글쓴이 </th>
       <td> <input type="text" name="board_name" id="board_name"
       		 class="input_box" size="14" value="<%=vo.getBoard_name() %>" /></td>
    </tr>
    <tr>
       <th> 글제목 </th>
       <td> <input type="text" name="board_title" id="board_title"
       		 class="input_box" size="14" value="<%=vo.getBoard_title() %>" /></td>
    </tr>
    <tr>
       <th> 글내용 </th>
       <td> <textarea name="board_cont" id="board_cont" 
       	 cols="40" rows="10"><%=vo.getBoard_cont() %>
              </textarea>
       </td>
    </tr>
    <tr>
       <th> 비밀번호 </th>
       <td> <input type="password" name="board_pwd" 
                 id="board_pwd" size="14" class="input_box"/> 
    </tr>    
 </table>
 <br>
   <input type="submit" value="수정" id="resultInput" class="boardwrite_b"/>
   <input type="button" value="취소" id="resultInput" onclick="history.back()"/>   
  </form>
  </div>

    
<div class="clear"></div>

</body>



