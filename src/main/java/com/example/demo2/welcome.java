package com.example.demo2;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "welcome", value = "/Welcome")
public class welcome extends HttpServlet {
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws IOException {
        //得到Session
        HttpSession hs=request.getSession(true);
        String val=(String)hs.getAttribute("pass");
        if(val==null) {//返回登陆界面
            response.sendRedirect("/demo2_war_exploded/login.jsp");
        }
        response.setCharacterEncoding("gb2312");
        String username=request.getParameter("uname");
        PrintWriter pw = response.getWriter();
        //登录次数记录
        int counter;
        HttpSession session = request.getSession(true);
        Object count = session.getAttribute("COUNTER");
        if(count == null)
            counter=1;
        else {
            counter= (Integer) count;
            counter++;
        }
        session.setAttribute("COUNTER", counter);
        //界面
        pw.println("<html>");
        pw.println("<body>");
        //Cookie获取上次访问时间
        Cookie[] cookies = request.getCookies();
        if (cookies!=null) {
            pw.write("您上次访问的时间是：");
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("lastAccessTime")) {
                    long lastAccessTime = Long.parseLong(cookie.getValue());
                    Date date = new Date(lastAccessTime);
                    pw.write(date.toLocaleString());
                }
            }
        } else {
            pw.write("这是您第一次访问本站！");
        }
        Cookie cookie = new Cookie("lastAccessTime",
                System.currentTimeMillis()+"");
        cookie.setMaxAge(60*60);
        response.addCookie(cookie);

        pw.println("<h1>" +"主界面" +"</h1>");
        pw.println("welcome "+username+"<br>");
        pw.println("这是你第"+counter+"访问本站");
        pw.println("<h2>"+"Now time"+"</h2>");
        pw.println("<br>"+new Date()+"<br>");
        pw.println("<a href ='/demo2_war_exploded/login.jsp'>返回重新登录 </a><br>");
        pw.println("<a href ='/demo2_war_exploded/welcome.jsp'>前往商城</a><br>");
        pw.println("<a href ='/demo2_war_exploded/idiom.jsp'>人机对战</a><br>");
        pw.println("</body>");
        pw.println("</html>");
    }

    public void doPost(HttpServletRequest request,
                HttpServletResponse response) throws IOException {
        this.doGet(request, response);

    }
}
