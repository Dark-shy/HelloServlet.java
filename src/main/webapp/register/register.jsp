<%--
  Created by IntelliJ IDEA.
  User: 86150
  Date: 2022/10/22
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>新账户注册</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
</head>
<body>
<div class="row">&nbsp</div><div class="row">&nbsp</div><div class="row">&nbsp</div>
<div class="row">&nbsp</div><div class="row">&nbsp</div><div class="row">&nbsp</div>
<div class="row">&nbsp</div><div class="row">&nbsp</div><div class="row">&nbsp</div>
<div class="row"><p class="text-center display-3">Set up</p></div>
<div class="row">&nbsp</div>
<form action="${pageContext.request.contextPath}/register_pd" class="was-validated">
    <div class="row">
        <div class="col-2 offset-5"><input type="text" class="form-control"  placeholder="username" name="username" required></div>
    </div>
    <div class="row">&nbsp</div>
    <div class="row">
        <div class="col-2 offset-5"><input type="password" class="form-control"  placeholder="password" name="password" required></div>
    </div>
    <div class="row">&nbsp</div>
    <div class="row"><div class="col-2 offset-5">
        <div class="row"><div class="col-2 offset-3"><input class=" btn btn-outline-light btn-lg" type="submit" value="确认">
        </div></div></div></div>

</form>
</body>
</html>
