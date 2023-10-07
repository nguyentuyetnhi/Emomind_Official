/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class DAO implements DBContext{
    public static Connection getConnect(){
        try{ 
            Class.forName(DRIVERNAME); 
	} catch(ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
	}
        try{            
            Connection con = DriverManager.getConnection(DBURL,USERDB,PASSDB);
            return con;
        }
        catch(SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }
    
    public Account login(String user, String pass) {
        String query = "select UserName, Password from Users\n"
                + "where UserName = ?\n"
                + "and Password = ?";
        try (Connection con=getConnect()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),rs.getString(2));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Account getAccount (String username) {
        String query = "select * from Users where UserName = ?";
        try (Connection con=getConnect()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6), rs.getString(7));
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public String getPass (String username) {
        String query = "select Password from Users where UserName = ?";
        try (Connection con=getConnect()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void insertAccount(String username, String password, String name, String email, String phone) {
        String query = "insert into Users (UserName, Password, Name, Email, Phone)  values (?, ? , ?, ?, ?);";
        try (Connection con=getConnect()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setNString(3, name);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String getUsername(String username) {
        String query = "select UserName from Users\n"
                + "where UserName = ?";
        try (Connection con=getConnect()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public String getEmail(String email) {
        String query = "select Email from Users\n"
                + "where Email = ?";
        try (Connection con=getConnect()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public String getPhone(String phone) {
        String query = "select Phone from Users\n"
                + "where Phone = ?";
        try (Connection con=getConnect()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, phone);
            ResultSet rs=ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void changePass(String username, String passsword) {
        String query = "update Users set Password = ?  where UserName = ?";       
        try (Connection con=getConnect()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, passsword);
            ps.setString(2, username);         
            ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void changePassByEmail(String email, String passsword) {
        String query = "update Users set Password = ?  where email = ?";       
        try (Connection con=getConnect()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, passsword);
            ps.setString(2, email);         
            ps.executeUpdate();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateProfile(String username, String name, String email, String phone, String img) throws Exception {
        String query = "update Users set Name = ?, Email = ?, Phone = ?, img = ? where UserName = ?";
        
        try(Connection con=getConnect()) {
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setNString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, img);
            stmt.setString(5, username);
            stmt.executeUpdate();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updatePassword(String username, String password) throws Exception {
        String query = "update Users set Password = ? where UserName = ?";
        
        try(Connection con=getConnect()) {
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setNString(1, password);
            stmt.setString(2, username);
            stmt.setString(5, username);
            stmt.executeUpdate();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
