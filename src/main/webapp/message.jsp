<%@ page import="com.example.demo2.message" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 86150
  Date: 2022/11/8
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>speak</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<%

    String[] title=(String[]) session.getAttribute("title");
    String[] text=(String[]) session.getAttribute("text");
    session.removeAttribute("title");
    session.removeAttribute("text");
%>
<body>

<div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
        <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
            <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" fill="currentColor" class="bi bi-emoji-sunglasses-fill" viewBox="0 0 16 16">
                <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zM2.31 5.243A1 1 0 0 1 3.28 4H6a1 1 0 0 1 1 1v.116A4.22 4.22 0 0 1 8 5c.35 0 .69.04 1 .116V5a1 1 0 0 1 1-1h2.72a1 1 0 0 1 .97 1.243l-.311 1.242A2 2 0 0 1 11.439 8H11a2 2 0 0 1-1.994-1.839A2.99 2.99 0 0 0 8 6c-.393 0-.74.064-1.006.161A2 2 0 0 1 5 8h-.438a2 2 0 0 1-1.94-1.515L2.31 5.243zM4.969 9.75A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .866-.5z"></path>
            </svg>
            <span class="fs-4">Nothing store</span>
        </a>

        <ul class="nav nav-pills">
            <li class="nav-item"><a class="nav-link text-black" href="add_message.jsp" ><strong>发表留言</strong>
            </a></li>

        </ul>
    </header>
    <p class="fs-1 text-warning text-center">留  言  板</p>
    <%
        int i=0;
        while (title[i]!=null){
    %>
    <div class="card " >
        <div class="card-body">
            <h4 class="card-title"><%=title[i]%></h4>
            <p class="card-text"><%=text[i]%></p>
        </div>
    </div>
    <div class="dropdown-divider"></div>
    <% i++;}%>
</div>
</body>
</html>
