package com.example.demo2;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Dao_goods {


    public List<goods> get_goods() throws SQLException {
        execution sql=new execution();
        return sql.get_goods();
    }
}
