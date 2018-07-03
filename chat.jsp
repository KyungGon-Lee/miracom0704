<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
  <html>
    <head>
      <meta http-equiv="refresh" content="3; url=chat.jsp">
    </head>
    <body>
      <%
      if(request.getParameter("msg") !=null){
        String view = (String)application.getAttribute("view");
        view += (String)request.getParameter("msg") + "<br>";
        if( ((String)request.getParameter("msg")).equals("clear") ){

        }
        application.setAttribute("view", view);
        response.sendRedirect("chatmsg.html");
      }
      %>

      <div style=
        'background-color:yellow;height:280px;width=100%;overflow-y:auto'
        id='view'>
        <%= application.getAttribute("view") %>
      </div>

      <script>
        var o = document.getElementById("view");
        o.scrollTop = o.scrollHeight;
      </script>

    </body>
  </html>
