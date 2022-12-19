<%--
  Created by IntelliJ IDEA.
  User: 86150
  Date: 2022/11/8
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
<%--  <meta http-equiv="refresh" content="0.1;url=/demo2_war_exploded/welcome.jsp">--%>
</head>
<%session.setAttribute(request.getParameter("id"),"like");%>
<body>
<%--<jsp:forward page="welcome.jsp"></jsp:forward>--%>
<%--<script>window.close()</script>--%>
<script>
    function go(){
        window.history.go(-1);
    }
    setTimeout("go()",1)
</script>
</body>
</html>
