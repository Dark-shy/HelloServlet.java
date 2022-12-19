<%@ page import="com.example.demo2.execution" %><%--
  Created by IntelliJ IDEA.
  User: 86150
  Date: 2022/11/10
  Time: 23:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>成语接龙</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
</head>
<%
    String word = request.getParameter("word");
    String long_queue;
    if (request.getParameter("text")==null)
        long_queue="开始";
    else {
        long_queue=request.getParameter("text");
    }
    execution sql=new execution();
    String new_word="NULL";
    if(word !=null){
        new_word=sql.get_word(word.substring(3,4));
        long_queue=long_queue+"→"+word+"→"+new_word;
    }
    if(long_queue.length()>12) {
        int x = long_queue.length();
        if (!long_queue.substring(x - 11, x - 10).equals(long_queue.substring(x - 9, x - 8)))
            response.sendRedirect("/demo2_war_exploded/idiom.jsp");
    }
%>
<body class="container">
<p class="fs-1">成语接龙人机大战</p>
<div class="dropdown-divider"></div>
<%if (!new_word.equals("NULL")){%>
<p class="fs-3"><svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" fill="currentColor" class="bi bi-robot" viewBox="0 0 16 16">
    <path d="M6 12.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5ZM3 8.062C3 6.76 4.235 5.765 5.53 5.886a26.58 26.58 0 0 0 4.94 0C11.765 5.765 13 6.76 13 8.062v1.157a.933.933 0 0 1-.765.935c-.845.147-2.34.346-4.235.346-1.895 0-3.39-.2-4.235-.346A.933.933 0 0 1 3 9.219V8.062Zm4.542-.827a.25.25 0 0 0-.217.068l-.92.9a24.767 24.767 0 0 1-1.871-.183.25.25 0 0 0-.068.495c.55.076 1.232.149 2.02.193a.25.25 0 0 0 .189-.071l.754-.736.847 1.71a.25.25 0 0 0 .404.062l.932-.97a25.286 25.286 0 0 0 1.922-.188.25.25 0 0 0-.068-.495c-.538.074-1.207.145-1.98.189a.25.25 0 0 0-.166.076l-.754.785-.842-1.7a.25.25 0 0 0-.182-.135Z"></path>
    <path d="M8.5 1.866a1 1 0 1 0-1 0V3h-2A4.5 4.5 0 0 0 1 7.5V8a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1v1a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-1a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1v-.5A4.5 4.5 0 0 0 10.5 3h-2V1.866ZM14 7.5V13a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V7.5A3.5 3.5 0 0 1 5.5 4h5A3.5 3.5 0 0 1 14 7.5Z"></path>
</svg>&nbsp;<%=new_word%></p>
<%}%>
<form action="idiom.jsp" class="was-validated">
    <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" fill="currentColor" class="bi bi-person-bounding-box" viewBox="0 0 16 16">
        <path d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z"></path>
        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"></path>
    </svg>&nbsp; <input type="text" name="word"  minlength="4" maxlength="4" required onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'')">

    <div class="dropdown-divider"></div>
    <textarea name="text" class="form-control" readonly><%=long_queue%></textarea>
</form>
</body>
</html>
