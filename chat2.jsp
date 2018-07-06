<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<html>
<%
  if ( request.getParameter("msg") != null )  {
	  String view = (String)application.getAttribute("view");
	  view += (String)request.getParameter("msg") + "<br>";
	  application.setAttribute("view", view);
  } else {
%>
   <%= application.getAttribute("view")%>
<%
  }
%>
</html>
