package com.example.demo2;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;

/*
 * 演示验证码的生成到html中来进行显示
 *
 */

import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/yanzhengma")
public class ServletYanZhengMa extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String code = drawImg(output);
        //在这里还可以将验证码的信息保存到session中，方便进行登陆的时候判断是否正确
//        try {
            System.out.println(code);
            request.getSession().setAttribute("code",code);
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    //绘制验证码
    private String drawImg(ByteArrayOutputStream output) {
        String code = "";
        for (int i = 0; i < 4; i++) {
            code += randomChar();
        }
        int width = 70;
        int height = 25;
        BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
        Font font = new Font("Times New Roman", Font.PLAIN, 20);
        Graphics2D g = bi.createGraphics();
        g.setFont(font);
        Color color = new Color(1, 37, 73);
        g.setColor(color);
        g.setBackground(new Color(255, 255, 255, 255));
        g.clearRect(0, 0, width, height);
        FontRenderContext context = g.getFontRenderContext();
        Rectangle2D bounds = font.getStringBounds(code, context);
        double x = (width - bounds.getWidth()) / 2;
        double y = (height - bounds.getHeight()) / 2;
        double ascent = bounds.getY();
        double baseY = y - ascent;
        g.drawString(code, (int) x, (int) baseY);
        g.dispose();
        try {
            ImageIO.write(bi, "jpg", output);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return code;
    }
    //生成四位数的验证码（这里就是在字母和数字之间产生，如果你需要更多的符号，那么就自己添加在String中就可以了哦）
    private char randomChar() {
        Random r = new Random();
        String s = "qwertyuiopasdfghjklzxcvbnm0123456789";
        return s.charAt(r.nextInt(s.length()));
    }

}