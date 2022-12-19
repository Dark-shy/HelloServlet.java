<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<%--<%--%>
<%--    Cookie[] cookies=request.getCookies();--%>
<%--    if (cookies != null){--%>
<%--        for (Cookie cookie : cookies){--%>
<%--            HttpSession hs = request.getSession(true);--%>
<%--            hs.setMaxInactiveInterval(20);--%>
<%--            hs.setAttribute("pass", "ok");--%>
<%--            if (cookie.getName().equals("username"))response.sendRedirect("/demo2_war_exploded/Welcome");--%>
<%--        }--%>
<%--    }--%>
<%--%>--%>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
</head>

<body>
<div class="row">&nbsp</div><div class="row">&nbsp</div><div class="row">&nbsp</div>
<div class="row">&nbsp</div><div class="row">&nbsp</div><div class="row">&nbsp</div>
<div class="row">&nbsp</div><div class="row">&nbsp</div><div class="row">&nbsp</div>
<div class="row"><p class="text-center display-3">Login</p></div>
<div class="row">&nbsp</div>
<%
    String[] text= {"验证码错误","账户或密码错误"};
    int id=1;
    if(request.getParameter("i") !=null){
        if(request.getParameter("i").equals("2")) id=0;
%>
<div  class="row">
    <div class="col-2 offset-5">
        <div class="alert alert-danger alert-dismissible fade show">
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            <strong>错误!</strong>&nbsp;<%=text[id]%>
        </div></div></div>
<%}%>
<form  action=/demo2_war_exploded/login_pd method=post class="was-validated">
    <div class="row">
        <div class="col-2 offset-5"><input type="text" class="form-control"  placeholder="username" name="username" required></div>
    </div>
    <div class="row">&nbsp</div>
    <div class="row">
        <div class="col-2 offset-5"><input type="password" class="form-control"  placeholder="password" name="passwd" required></div>
    </div>
    <div class="row">
        <div class="col-2 offset-5">
    <img src="${pageContext.request.contextPath}/yanzhengma"></div>
    </div>
    <div class="row">
    <div class="col-2 offset-5"><input type="text" class="form-control"  placeholder="you_saw" name="yanzhengma" required></div>
    </div>
    <div class="row">&nbsp</div>
    <div class="row form-check form-switch">
        <div class="col-2 offset-5"><div class="form-check mb-3">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember"> Remember me
            </label>
        </div></div>
    <div class="row">
        <div class="col-2 offset-5"> <div class="row"> <div class="col-6"><input type="submit" class="btn text-muted" value=登录></div>
            <div class="col-6 flex-row-reverse">
            <a class="btn text-muted" href="register/register.jsp">注册</a></div></div></div></div>

    </div>

</form>




<%--<div class="login-box">--%>
<%--<h2>Login</h2>--%>
<%--<form action=/demo2_war_exploded/login_pd method=post>--%>
<%--        <table>--%>
<%--            <tr><td>用&nbsp户&nbsp名：</td>--%>
<%--                <td><input type=text name=username></td></tr>--%>
<%--    <tr><td>&nbsp密&nbsp&nbsp码&nbsp：</td>--%>
<%--        <td><input type=password name=passwd></td></tr>--%>
<%--    <tr> <td>验证码<img id=image src=/demo2_war_exploded/yanzhengma></td>--%>
<%--        <td><input type=text name=yanzhengma></td> </tr>--%>
<%--            <tr><td>免登录：<input type="radio" name="login" value="1"><br></td><td><input type=submit value="登录"><br></td></tr>--%>
<%--    <tr><td>没有账户?</td><td><a href="register/register.jsp">注册</a></td></tr>--%>
<%--    </table>--%>
<%--</form>--%>
<%--</div>--%>
</body>
</html>
