/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package database;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author tramy
 */
public class Dao implements Serializable {

    private Connection conn = DBUtil.makeConnection();
    //PreparedStatement pr =null;
    //ResultSet rs = null;
    private static Dao instance;

    public Dao() {
    }

    public static Dao getInstance() {

        if (instance == null) {
            instance = new Dao();
        }
        return instance;
    }
   
    private static final String SELECT_USER_FREQUENCY = "SELECT * FROM usage_data WHERE user_id = ? AND password = ?";
    private static final String UPDATE_LOGIN_COUNT = "UPDATE usage_data SET login_count = ?, last_login_date = ?, monthly_login_count = ? WHERE user_id = ?";

    public User getAll(String user_id, String password) {
        PreparedStatement stm;
        ResultSet rs;

        User acc = new User();

        try {

            String sql = SELECT_USER_FREQUENCY;
            stm = conn.prepareStatement(sql);
            stm.setString(1, user_id);
            stm.setString(2, password);
            rs = stm.executeQuery();

            while (rs.next()) {
                java.sql.Date date = rs.getDate("last_login_date");
                LocalDate localDate = date != null ? date.toLocalDate() : null;
                return acc = new User(rs.getString("user_id"),
                        rs.getInt("password"),
                        rs.getInt("login_count"),
                        localDate,
                        rs.getInt("monthly_login_count")
                        
                );
            }
        } catch (Exception ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }

    public void updateLoginCount(String user_id, int login_count, LocalDate last_login_date, int monthly_login_count ) {
        PreparedStatement stm;
//        ResultSet rs;
        try {

            String sql = UPDATE_LOGIN_COUNT;
            stm = conn.prepareStatement(sql);
            stm.setInt(1, login_count);
            stm.setDate(2, java.sql.Date.valueOf(last_login_date));
            stm.setInt(3, monthly_login_count);
            stm.setString(4, user_id);
            stm.executeUpdate();
            
            
        } catch (Exception ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
