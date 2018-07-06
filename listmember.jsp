<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>


<html>
<head>
<title>Insert title here</title>
</head>
<body>
 <%if(session.getAttribute("id") == null){out.println("<script>alert('no~~~');location.href='home.html;'</script>");}%>
<a href=registerform.jsp> 회원가입  </a>
<a href=service.jsp>서비스페이지</a>

<%
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pass = "hr";
	Connection conn;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	conn = DriverManager.getConnection(url, user, pass);
	String sql = "select * from member";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);

%>

<table border=1>
<%  
	while(rs.next()){
%>
    <tr>
      <td> <%= rs.getString("id") %> </td>
      <td> <%= rs.getString("name")%> </td>
      <td> <%= rs.getString("pwd")%> </td>
      <td> <%= rs.getString("gender").equals("man") ? 
    		  "<img src=1.png width=50 height=50>": 
    	      "<img src=3.jpg width=50 height=50>" %></td>
      <td> <%= rs.getString("hobby")%> </td>      
      <td> <a href=delmember.jsp?id=<%= rs.getString("id")%>>삭제</a> </td>
      <td> <a href=editmemberform.jsp?id=<%= rs.getString("id")%>>수정</a></td>      
    </tr>	
	   	     
<%
	}
	rs.close();
	stmt.close();    
	conn.close();
%>	   

</table>



 
</body>
</html>