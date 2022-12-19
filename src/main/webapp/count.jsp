<%--
  Created by IntelliJ IDEA.
  User: 86150
  Date: 2022/11/12
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>计数</title>
</head>
<%
  //session
  int count1=1;
  if (session.getAttribute("count1")!=null)
      count1=(int)session.getAttribute("count1");
  session.setAttribute("count1",count1+1);
  //Cookie
  int count2=1;
  Cookie[] cookies=request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("count2")) {
                count2 = Integer.parseInt(cookie.getValue());
            }
        }
    }
    String add= String.valueOf(count2+1);
    Cookie cookie1=new Cookie("count2",add);
    cookie1.setMaxAge(60*60);
    response.addCookie(cookie1);
    //application
    Integer count3=1;
    if (application.getAttribute("count3")!=null)
     count3=(Integer) application.getAttribute("count3");
    application.setAttribute("count3",count3+1);
%>

<body>
session <%=count1%>
cookie  <%=count2%>
application <%=count3%>
<br>
javaBean
<jsp:useBean id="pageScope" scope="page" class="scope.Scope"/>
<%out.print("page获取:"+pageScope.getNmuber());%>
<jsp:useBean id="requestScope" scope="request" class="scope.Scope"/>
<%out.print("request获取"+requestScope.getNmuber());%>
<jsp:useBean id="sessionScope" scope="session" class="scope.Scope"/>
<%out.print("session获取"+sessionScope.getNmuber());%>
<jsp:useBean id="applicationScope" scope="application" class="scope.Scope"/>
<%out.print("application获取"+applicationScope.getNmuber());%>

</body>

</html>
