<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*,javax.sql.*, javax.naming.*" %>

<%
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, "hr", "hr");
	String id = request.getParameter("id");
	String sql = "select * from member where id = '" + id + "'";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	String name = rs.getString("name");
	String pwd = rs.getString("pwd");
	String gender = rs.getString("gender");
	String hobby = rs.getString("hobby");
	conn.close();
%>

<form action="editmember.jsp"> 
아이디 : <input type="text" name="id" readonly value=<%=id%>><br/>
이름:<input type="text" name="name"value=<%=name%>><br/>
패스워드 : <input type="password" name="pwd" value=<%=pwd%>><br/>
성별:<input type="radio" value="man" name="gender" 
<%=gender.equals("man") ? "checked" : "" %>>남자
<input type="radio" value="woman" name="gender"
<%=gender.equals("woman") ? "checked" : "" %>>여자<br/>
취미:
<input type="checkbox" value="운동 " name="hobby"
<%=hobby.indexOf("운동") >= 0 ? "checked":"" %>>운동
<input type="checkbox" value="영화" name="hobby"
<%=hobby.indexOf("영화") >= 0 ? "checked":"" %>>영화
<input type="checkbox" value="여행 " name="hobby"
<%=hobby.indexOf("여행") >= 0 ? "checked":"" %>>여행
<input type="checkbox" value="게임" name="hobby"
<%=hobby.indexOf("게임") >= 0 ? "checked":"" %>>게임
<input type="checkbox" value="독서" name="hobby"
<%=hobby.indexOf("독서") >= 0 ? "checked":"" %>>독서
<input type="checkbox" value="낚시 " name="hobby"
<%=hobby.indexOf("낚시") >= 0 ? "checked":"" %>>낚시<br/>
<input type="submit" value="보내기"/> 
<input type="reset" value="다시입력"/>
</form>

</html>