<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*,javax.sql.*, javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>


<%
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pass = "hr";
	Connection conn;	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	System.out.println("hello");
	
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String gender = request.getParameter("gender");
	String hobbys[] = request.getParameterValues("hobby");
	String hobby = Arrays.toString(hobbys).toString();
	
	String sql = "update member set name = ?, pwd = ?, gender = ?, hobby = ?  where id = ?";
	out.println(sql);
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);	
	pstmt.setString(2, pwd);
	pstmt.setString(3, gender);
	pstmt.setString(4, hobby);
	pstmt.setString(5, id);
	
	int r = pstmt.executeUpdate(); 
	conn.close();
	
	if ( r >= 1 ) response.sendRedirect("listmember.jsp");
	else {
%>
		 	<script>
		 	    alert("삭제할 정보가 없습니다.");
		 	    window.location = "listmember.jsp";
		 	</script>
		 	
<% 
 	}
%>		
	


</body>
</html>