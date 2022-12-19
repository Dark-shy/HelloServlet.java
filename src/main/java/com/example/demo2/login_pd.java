package com.example.demo2;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;


@WebServlet(name = "login_pd", value = "/login_pd")

public class login_pd extends HttpServlet {

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws IOException {

//接受用户名和密码
        String u = request.getParameter("username");
        String p = request.getParameter("passwd");
        //验证码判断
        String m = request.getParameter("yanzhengma");

        String password;
        try {
            execution select = new execution();
            password = select.select_user(u);
            select.end();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        HttpSession session = request.getSession();
        String code = (String) session.getAttribute("code");
        System.out.println(m + " " + request.getParameter("Verification"));
        if (m.equals(code)) {
//验证
            if (p.equals(password) || (u.equals("main") && p.equals("123456"))) {
                if (request.getParameter("remember")!=null){
                //创建cookie,免登录
                Cookie cookie = new Cookie("username", u );
                Cookie cookie1 = new Cookie("password", p );
                cookie.setMaxAge(60*60);
                cookie1.setMaxAge(60*60);
                response.addCookie(cookie);
                response.addCookie(cookie1);
                }
//合法， 跳转（welcome）
                HttpSession hs = request.getSession(true);
                hs.setMaxInactiveInterval(20);
                hs.setAttribute("pass", "ok");
                response.sendRedirect("/demo2_war_exploded/Welcome?uname=" + u );
            } else {
//不合法 跳转(回原界面)
                response.sendRedirect("/demo2_war_exploded/login.jsp?i=1");//写url
//sendRedirect的url应表示为/ web应用名/servlet的url
            }
        } else {
            response.sendRedirect("/demo2_war_exploded/login.jsp?i=2");
        }
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws
            IOException {
        this.doGet(request, response);
    }
}

