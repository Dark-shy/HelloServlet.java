package com.example.demo2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
@WebServlet(name = "cookie",value = "/cookie")
public class cookie  extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean flag = false ;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals("username")) {
                    String u = cookie.getValue();
                    flag = true;
                    HttpSession hs = request.getSession(true);
                    hs.setMaxInactiveInterval(200);
                    hs.setAttribute("pass", "ok");
                    response.sendRedirect("/demo2_war_exploded/Welcome?uname="+u);
                }
            }
        }
        if (!flag)
            response.sendRedirect("/demo2_war_exploded/login.jsp");
    }
}
