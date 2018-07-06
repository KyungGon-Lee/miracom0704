<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <table>
      <tr>
    <iframe src="youknowme.html" scrolling="yes" frameBorder="0" width="50%" height="700"></iframe>
    <iframe src="chatframe2.html" scrolling="yes" frameBorder="0" width="50%" height="700"></iframe>
  </tr>
    </table>

    <%
    if(session.getAttribute("id") == null){
    	out.println("<script>alert('no~~~');location.href='home.html;'</script>");
    }
	%>
	<%=session.getAttribute("id")%> 님이 로그인했습니다. 
	
	<a href=logout.jsp> logout 해버리깅</a>
	<a href=registerform.jsp>회원가입</a>
	<a href=listmember.jsp>회원목록</a>
  </body>

</body>
</html>