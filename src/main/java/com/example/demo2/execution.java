package com.example.demo2;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class execution {
    //链接数据库所需信息
    static final String URL = "jdbc:mysql://localhost:3306/shopping";//jdbc：协议://ip地址:端口号/数据库名
    static final String USER = "root";                            //用户名
    static final String PASS = "124357689";                       //密码
    static Driver driver = null;
    static Connection connection = null;

    //在构造方法中连接数据库
     public execution() throws SQLException {
        driver = new com.mysql.cj.jdbc.Driver();
        DriverManager.registerDriver(driver);
        connection = DriverManager. getConnection(URL, USER, PASS);
    }
    public List<goods> get_goods() throws SQLException {
        String sql = "select * from goods";
        PreparedStatement cs = connection.prepareStatement(sql);
        ResultSet jg = cs.executeQuery();
        List<goods> goodsList=new ArrayList<>();
        while (jg.next()){
            goods Goods=new goods();
            Goods.setId(jg.getString("id"));
            Goods.setName(jg.getString("name"));
            Goods.setNumber(jg.getString("number"));
            Goods.setPrice(jg.getString("price"));
            goodsList.add(Goods);
        }
        jg.close();
        cs.close();
        return goodsList;
    }

    //依照用户名查询user数据库内容
    public String select_user(String username) throws SQLException {
        String sql = "select * from user where username= ? ";
        PreparedStatement cs = connection.prepareStatement(sql);
        cs.setString(1, username);
        ResultSet jg = cs.executeQuery();
        String password=null;
        if (jg.next())
         password=jg.getString("password");
        cs.close();
        jg.close();
        return password;
    }
    //创建新用户
    public Boolean insert_user(String username,String password) throws SQLException {
        String sql="insert into user(username,password)values(?,?)";
        PreparedStatement add=connection.prepareStatement(sql);
        add.setString(1,username);
        add.setString(2,password);

        return add.execute();
    }
    //获取留言板
    public String[] select_title() throws SQLException {
        String[] message = new String[99];
        int i = 0 ;
        String sql = "select title from message";
        PreparedStatement cs = connection.prepareStatement(sql);
        ResultSet jg = cs.executeQuery();
        while (jg.next()) {
            message[i] = jg.getString("title");
            i++;
        }
        cs.close();
        jg.close();
        return message;
    }
    public String[] select_text() throws SQLException {
        String[] message = new String[99];
        int i = 0 ;
        String sql = "select text from message";
        PreparedStatement cs = connection.prepareStatement(sql);
        ResultSet jg = cs.executeQuery();
        while (jg.next()) {
            message[i] = jg.getString("text");
            i++;
        }
        cs.close();
        jg.close();
        return message;
    }
    //增加留言
    public void insert_message(String title, String text) throws SQLException {
        String sql="insert into message(title,text)values(?,?)";
        PreparedStatement add=connection.prepareStatement(sql);
        add.setString(1,title);
        add.setString(2,text);

        add.execute();
    }
    //成语查询
    public String get_word(String word) throws SQLException {
        String sql = "select word from idiom where word like ? ";
        PreparedStatement cs = connection.prepareStatement(sql);
        cs.setString(1, word+"%");
        ResultSet jg = cs.executeQuery();
        String password=null;
        if (jg.next())
            password=jg.getString("word");
        cs.close();
        jg.close();
        return password;
    }
    //关闭流
     void end() throws SQLException {
        connection.close();
    }
}

