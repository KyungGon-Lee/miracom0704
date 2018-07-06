<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
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
	
	String sql = "delete from member where id = '" + id + "'";
	
	out.println(sql);
	Statement stmt = conn.createStatement();
	int r = stmt.executeUpdate(sql);
	conn.close();
	
	if ( r >= 1 ) response.sendRedirect("listmember.jsp");
	else  {
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