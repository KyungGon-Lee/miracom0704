<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	import="java.sql.*"
    pageEncoding="EUC-KR"%>

<%
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pass = "hr";
	Connection conn;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	System.out.println("hello");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	String sql = "select count(id) from member where id = ? and pwd = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	int count = rs.getInt(1);
	rs.close();
	conn.close();
	if(count >= 1) session.setAttribute("id", id);
	
	%>{"msg":"<%=count>=1?"ok":"no" %>"}

=======
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
String username = request.getParameter("username");
String pwd = request.getParameter("pwd");
String msg = "";
if(username.equals(pwd)) msg = "ok";
else msg = "no";
%>
{"msg" : "<%=msg%>"}
>>>>>>> e86e037709a575aba9fcba5c8010ed08ae01b740
