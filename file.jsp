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
	//ResultSet�� ���ڵ�� �ʵ带 �����ϴ� Ŭ������
	//����Ŭ��񿡼� Ŀ�� ���ϸ� ������ �ȵ��� �ȳ��� ����Ŭ���� ��ɹ� �����Ѵٰ� �ٷ� ����Ǵ°� �ƴ�
	while(rs.next()){
		out.println("name : " + rs.getString("name") + "<br>");
	}
	
	
%>
</body>
</html>