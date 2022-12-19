<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello1 Servlet</a>
<%--<meta http-equiv="refresh" content="0.1;url=/demo2_war_exploded/cookie">--%>
<jsp:forward page="/cookie"></jsp:forward>
</body>
</html>