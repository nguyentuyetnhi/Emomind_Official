/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package Model;

import Model.Account;
import Model.Feedback;
import Model.ItemMethod;
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
public class DAO implements Serializable {

    private Connection conn = DBUtil.makeConnection();
    //PreparedStatement pr =null;
    //ResultSet rs = null;
    private static DAO instance;

    public DAO() {
    }

    public static DAO getInstance() {

        if (instance == null) {
            instance = new DAO();
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
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Feedback> getFeedbackList() {
        String query = "Select FeedbackID, Title, Message, Creator from Feedback;";
        List<Feedback> feedbackList = new ArrayList<>();
        try  {
            System.out.println("Connect success");
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                feedbackList.add(new Feedback(Integer.parseInt(rs.getString("FeedbackID")), rs.getString("Title"), rs.getString("Message"), Integer.parseInt(rs.getString("Creator"))));
            }
            return feedbackList;
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addFeedback(Feedback feedback) {
        String query = "Insert into Emomind.dbo.Feedback(Title, Message, Creator) values (?,?,?);";
        List<Feedback> feedbackList = new ArrayList<>();
        try  {
            PreparedStatement ps = conn.prepareStatement(query);
            System.out.println("Connect success");
            ps.setString(1, feedback.getTitle());
            ps.setString(2, feedback.getMessage());
            ps.setInt(3, feedback.getCreator());
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<ItemMethod> SearchMethod(String searchPattern) {
        List<ItemMethod> itemList = new ArrayList<>();
        String query = "Select ItemMethod.ID as ItemID, Link, MethodID, Method.Name as MethodName, Image from ItemMethod, Method where ItemMethod.MethodID = Method.ID and Method.Name like ? order by ItemID;";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            System.out.println("Connect success");
            ps.setString(1,"%" + searchPattern + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("Hello");
                itemList.add(new ItemMethod(rs.getInt("ItemID"), rs.getString("Link"), rs.getInt("MethodID"), rs.getString("Image"), rs.getNString("MethodName")));
            }
            return itemList;
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public Account login(String user, String pass) {
        String query = "select UserID, UserName, Password, img from Users\n"
                + "where UserName = ?\n"
                + "and Password = ?";
        try{
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),rs.getString(2), rs.getString(3), rs.getString(4));
            }
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Account getAccount (String username) {
        String query = "select * from Users where UserName = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6), rs.getString(7));
            }
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
   
    public String getPass (String username) {
        String query = "select Password from Users where UserName = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void insertAccount(String username, String password, String name, String email, String phone) {
        String query = "insert into Users (UserName, Password, Name, Email, Phone)  values (?, ? , ?, ?, ?);";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setNString(3, name);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String getUsername(String username) {
        String query = "select UserName from Users\n"
                + "where UserName = ?";
        try{
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public String getEmail(String email) {
        String query = "select Email from Users\n"
                + "where Email = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public String getPhone(String phone) {
        String query = "select Phone from Users\n"
                + "where Phone = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, phone);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void changePass(String username, String passsword) {
        String query = "update Users set Password = ?  where UserName = ?";       
        try{
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, passsword);
            ps.setString(2, username);         
            ps.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void changePassByEmail(String email, String passsword) {
        String query = "update Users set Password = ?  where email = ?";       
        try  {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, passsword);
            ps.setString(2, email);         
            ps.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateProfile(String username, String name, String email, String phone, String img) throws Exception {
        String query = "update Users set Name = ?, Email = ?, Phone = ?, img = ? where UserName = ?";
        
        try{
            PreparedStatement stmt=conn.prepareStatement(query);
            stmt.setNString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, img);
            stmt.setString(5, username);
            stmt.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updatePassword(String username, String password) throws Exception {
        String query = "update Users set Password = ? where UserName = ?";
        
        try{
            PreparedStatement stmt=conn.prepareStatement(query);
            stmt.setNString(1, password);
            stmt.setString(2, username);
            stmt.setString(5, username);
            stmt.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
