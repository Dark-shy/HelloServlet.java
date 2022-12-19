package com.example.demo2;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
@WebServlet(name = "register",value = "/register_pd")
public class register extends HttpServlet{
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws IOException {

//接受用户名和密码
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        Boolean result;
        try {
            execution a= new execution();
            result=a.insert_user(u,p);
            a.end();
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if(result)response.sendRedirect("/demo2_war_exploded/register/fail.jsp");
        else response.sendRedirect("/demo2_war_exploded/register/win.jsp");
    }
}
