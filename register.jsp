<%@ page language="java" contentType="text/html; charset=EUC-KR"
	import="java.sql.*, java.util.*"
    pageEncoding="EUC-KR"%>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String gender = request.getParameter("gender");
	String hobbys[] = request.getParameterValues("hobby");
	String hobby = Arrays.toString(hobbys).toString();
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, "hr", "hr");
	String sql;
	PreparedStatement pstmt;
	sql = "INSERT INTO member (id, name, pwd, gender, hobby)" + "VALUES(?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, pwd);
	pstmt.setString(4, gender);
	pstmt.setString(5, hobby);
	pstmt.executeUpdate();
	%>
	
	이름<%=name%><br/>
	아이디<%=id%><br/>
	패스워드<%=pwd%><br/>
	성별<%=gender%><br/>
	취미<%=hobby%><br/>
	<a href=registerform.jsp>회원가입</a>
	<a href=listmember.jsp>회원목록</a>
	</html>
	