/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Model.Account;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.lang3.RandomStringUtils;

/**
 *
 * @author ASUS
 */
public class DAO implements DBContext {

    public static Connection getConnect() {
        Connection con = null;
        try {
            Class.forName(DRIVERNAME);
            con = DriverManager.getConnection(DBURL, USERDB, PASSDB);

        } catch (SQLException e) {
            System.out.println("Error: " + e);
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Error loading driver" + e);
        }
        return con;
    }

    public List<Feedback> getFeedbackList2() {
        Connection con = null;
        List<Feedback> feedbackList = new ArrayList<>();
        String query = "Select FeedbackID, Title, Message, Creator from Feedback;";
        try {
            con = getConnect();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                System.out.println("Hello");
                feedbackList.add(new Feedback(Integer.parseInt(rs.getString("FeedbackID")), rs.getString("Title"), rs.getString("Message"), Integer.parseInt(rs.getString("Creator"))));
            }
            return feedbackList;
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                    Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    public List<Feedback> getFeedbackList() {
        String query = "Select FeedbackID, Title, Message, Creator from Feedback;";
        List<Feedback> feedbackList = new ArrayList<>();
        try ( Connection con = getConnect()) {
            System.out.println("Connect success");
            PreparedStatement ps = con.prepareStatement(query);
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
        try ( Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(query);
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
        try ( Connection con = getConnect()) {
            PreparedStatement ps = con.prepareStatement(query);
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
    
}
