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
	<%=session.getAttribute("id")%> ���� �α����߽��ϴ�. 
	
	<a href=logout.jsp> logout �ع�����</a>
	<a href=registerform.jsp>ȸ������</a>
	<a href=listmember.jsp>ȸ�����</a>
  </body>

</body>
</html>