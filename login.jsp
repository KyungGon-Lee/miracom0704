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
