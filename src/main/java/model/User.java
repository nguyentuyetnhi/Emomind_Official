/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author tramy
 */
public class User {

    public String user_id;
    public int password;
    public int login_count;
    public LocalDate last_login_date;
    public int monthly_login_count;

    public User() {
    }

    public User(String user_id, int password) {
        this.user_id = user_id;
        this.password = password;
    }

    public User(String user_id, int password, int login_count) {
        this.user_id = user_id;
        this.password = password;
        this.login_count = login_count;
    }

    public User(String user_id, int password, int login_count, LocalDate last_login_date, int monthly_login_count) {
        this.user_id = user_id;
        this.password = password;
        this.login_count = login_count;
        this.last_login_date = last_login_date;
        this.monthly_login_count = monthly_login_count;
    }
    

    public LocalDate getLast_login_date() {
        return last_login_date;
    }

    public void setLast_login_date(LocalDate last_login_date) {
        this.last_login_date = last_login_date;
    }

    public int getMonthly_login_count() {
        return monthly_login_count;
    }

    public void setMonthly_login_count(int monthly_login_count) {
        this.monthly_login_count = monthly_login_count;
    }
    

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getPassword() {
        return password;
    }

    public void setPassword(int password) {
        this.password = password;
    }

    public int getLogin_count() {
        return login_count;
    }

    public void setLogin_count(int login_count) {
        this.login_count = login_count;
    }
    
    public int getMonthlyUsageRate() {
        // Kiểm tra xem người dùng có đăng nhập bao giờ chưa
        if (this.login_count == 0) {
            return 0;
        }

        // Tính tỷ lệ sử dụng trong một tháng
        return (this.monthly_login_count / this.login_count) * 100;
    }

    @Override
    public String toString() {
        return "User{" + "user_id=" + user_id + ", password=" + password + ", login_count=" + login_count + ", last_login_date=" + last_login_date + ", monthly_login_count=" + monthly_login_count + '}';
    }

    
    
    
    
    
}
