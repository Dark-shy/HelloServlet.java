package com.example.demo2;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
@WebServlet(name = "message",value = "/message")
public class message extends HttpServlet {
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws IOException{
        String[][] message=new String[2][];
        try {
            execution a=new execution();
            if(request.getParameter("title")!=null){
                a.insert_message( request.getParameter("title"), request.getParameter("text"));
            }
            message[0]=a.select_title();
            message[1]=a.select_text();
            a.end();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        HttpSession session=request.getSession();
        session.setAttribute("title",message[0]);
        session.setAttribute("text",message[1]);
        response.sendRedirect("/demo2_war_exploded/message.jsp");
    }
    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws
            IOException {
        this.doGet(request, response);
    }
}
