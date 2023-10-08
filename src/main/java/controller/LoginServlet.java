/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import model.User;

/**
 *
 * @author tramy
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user_id = request.getParameter("user_id");
    String password = request.getParameter("password");

    // Get the DAO instance
    DAO dao = new DAO();
    // Get the user from the database
    User user = dao.getAll(user_id, password);
    // If the user is valid
    if (user != null) {
        // Get the current date
        LocalDate currentDate = LocalDate.now();

        // Increase the login count
        int loginCount = user.getLogin_count() + 1;

        // Check if the last login date is in the current month
        if (user.getLast_login_date() != null &&
            user.getLast_login_date().getMonth() == currentDate.getMonth() &&
            user.getLast_login_date().getYear() == currentDate.getYear()) {
            // If it is, increase the monthly login count
            user.setMonthly_login_count(user.getMonthly_login_count() + 1);
        } else {
            // If it's not, reset the monthly login count to 1
            user.setMonthly_login_count(1);
        }

        // Update the last login date to the current date
        user.setLast_login_date(currentDate);

        // Update the login count in the database
        dao.updateLoginCount(user_id, loginCount, currentDate, user.getMonthly_login_count());

        // Update the login count in the user object
        user.setLogin_count(loginCount);
        
        int monthlyUsageRate = user.getMonthlyUsageRate();
        System.out.println(monthlyUsageRate);
        // Set the user in the session
        request.getSession().setAttribute("user", user);

        // Redirect to the user page
        response.sendRedirect("user.jsp");
        } else {
            // Redirect back to the login page with an error message
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
