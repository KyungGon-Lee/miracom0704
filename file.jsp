<%@ page language="java" contentType="text/html; charset=EUC-KR"
	import="java.sql.*"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
	
	
	for(int i = 0; i < 10; i++){
		out.println("-->" + i + "<br>");
	}
	String sql = "select * from member";
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from member");
	//ResultSet이 레코드와 필드를 관리하는 클래스임
	//오라클디비에서 커밋 안하면 데이터 안들어가서 안나옴 오라클에서 명령문 실행한다고 바로 적용되는것 아님
	while(rs.next()){
		out.println("name : " + rs.getString("name") + "<br>");
	}
	
	
%>
</body>
</html>