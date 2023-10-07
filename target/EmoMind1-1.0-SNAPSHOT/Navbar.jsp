<%-- 
    Document   : Navbar
    Created on : Oct 7, 2023, 12:48:26 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Navbar Start -->
<!--<img src="img/logo.jpg" alt ="anh" style="">-->
<div class="row">
    <div class="col-12 col-md-4">
        <div class="col-12 col-md-4">
            <img  style=" width:200px;
                  height:50px; margin-top:20px;margin-left:10px;"class="logo" src="img/Group 1.png">
            <!-- <h2 style="background-color: #FBF8EF; color: black; margin-left: 20px; margin-top: 12px;">EmoMind</h2>-->
        </div>
        <div class="col-12 col-md-8 text-right"> <!-- S? d?ng text-right ?? ??t n?i dung bên ph?i -->
            <!---   <a href="mailto:ntnhi2023@gmail.com">ntnhi2023@gmail.com</a>-->
        </div>
    </div>
    <nav class="navbar navbar-expand bg navbar-light sticky-top px-2px-lg-3 py-lg-0" style="background-color: #FCECB2 ">
        <a href="index.html" class="navbar-brand">

        </a>
        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div  style="margin-left:50px;"class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav">
                <a href="index.html" class="nav-item nav-link ">Home</a>
                <a href="about.html" class="nav-item nav-link">About Us</a>
                <a href="contact.html" class="nav-item nav-link">Contact</a>
                <a href="ViewFeedbackServlet" class="nav-item nav-link">Feedback</a>
            </div>
            <div class="navbar-nav ml-auto"> <!-- S? d?ng ml-auto ?? ??t "Sign In" bên ph?i -->
                <a href="login.jsp" class="nav-item nav-link ml-auto active "><i class="fas fa-user"></i> Sign In</a>
            </div>
        </div>
    </nav>
</div>
<!-- Navbar End -->