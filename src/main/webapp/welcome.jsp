<%@ page import="java.util.List" %>
<%@ page import="com.example.demo2.goods" %>
<%@ page import="com.example.demo2.Dao_goods" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title>shopping</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/5.1.1/js/bootstrap.bundle.min.js"></script>
</head>
<script>
    function deleter(shop) {
        let url = "/demo2_war_exploded/add_session.jsp";
        window.location.href=url+"?id="+shop;
        // window.location.replace(url + "?id=" + shop);
        // window.open(url+"?id="+shop,"_blank", "alwaysLowered=yes")
    }
</script>
<%
    if (session.getAttribute("pass")==null)
        response.sendRedirect("/demo2_war_exploded/login.jsp");
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
            <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">User</a></li>
            <li class="nav-item"><a class="nav-link text-black" data-bs-toggle="offcanvas" href="#offcanvasRight" data-bs-toggle="hover" title="刷新后打开" ><strong>购物车</strong>
                <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
                    <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"></path>
                </svg></a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/message" class="nav-link text-black"><strong>留言板</strong>
                <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" fill="currentColor" class="bi bi-clipboard-minus-fill" viewBox="0 0 16 16">
                    <path d="M6.5 0A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3Zm3 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3Z"></path>
                    <path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1A2.5 2.5 0 0 1 9.5 5h-3A2.5 2.5 0 0 1 4 2.5v-1ZM6 9h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1 0-1Z"></path>
                </svg></a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/login.jsp" class="nav-link text-black"><strong>退出登录</strong>
                <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"></path>
                    <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"></path>
                </svg></a></li>
        </ul>
    </header>
    <div class="row">
<%
    List<goods> goodsList= new Dao_goods().get_goods();
    int row=0;
    String[] id = new String[100];
    String[] name=new String[100];
    for(goods i : goodsList){
    id[row] =i.getId();
    name[row]=i.getName();
%>
        <div class="col-3" >
            <div class="thumbnail">
                <img src="img/<%=i.getId()%>.png " style="width: 95%;height: 55%"  alt="#">
                <h4>￥ <%=i.getPrice()%></h4>
                <p><%=i.getName()%><br><small>货号:<%=i.getNumber()%></small></p>
                <button class="btn btn-outline-dark" onclick="deleter(<%=i.getId()%>)">
                    <svg xmlns="http://www.w3.org/2000/svg" width="10%" height="4%" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
                        <path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"></path>
                        <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"></path>
                    </svg></button>
            </div>
        </div>
<%
        row++;
    }%>
    </div>
</div>
<!--购物车-->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header">
        <span class="fs-4">你喜欢的商品</span>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="dropdown-divider"></div>
    <div class="offcanvas-body">
        <form action="/demo2_war_exploded/order">
            <%
                for (int i=0;i<id.length;i++) {
                    if (session.getAttribute(id[i]) != null) {
            %>
            <div class="offcanvas-body">
                <span class="fs-4">Name</span><kbd><%=name[i]%></kbd>
                <div class="form-floating mb-3 mt-3">
                    <select class="form-select" id="sel1" name=<%=id[i]%>>>
                        <option>0</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select>
                    <label for="sel1" class="form-label">购买数量(限购3双)</label>
                </div>
            </div>
            <div class="dropdown-divider"></div>
            <%
                    }
                }
            %>
            <input type="submit" class="btn btn-outline-dark float-end" value="提交订单">
        </form>
    </div>
</div>
</body>
</html>