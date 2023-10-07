<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" session = "true"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>EmoMind</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>


    
    <!-- Navbar End -->
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        .login-container {
            width: 600px;
            height:450px;
            border-radius: 25px;
            margin: 0 auto;
            margin-top: 50px;
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color:#EDE5C8;
        }
        .login-container h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: flex;
            font-weight: bold;
        }
        .form-group input {
            width: 500px;
            height:300px;
           
            border: 1px solid #ccc;
            border-radius: 20px;
        }
        .form-group button {
            width: 20%;
            height:35px;
            padding: 10px;
            background-color:#fff;
            color: back;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: small;
            margin-top:10px;
            margin-left:300px;
            
        }
        
        
    </style>
</head>
<body>
    <!-- Navbar Start -->
   
    <!--<img src="img/logo.jpg" alt ="anh" style="">-->
    <div class="row">
        <div class="col-12 col-md-4">
            <div class="col-12 col-md-4">
                <img  style=" width:200px;
                height:50px; margin-top:20px;margin-left:10px;"class="logo" src="img/Group 1.png">
         <!-- <h2 style="background-color: #FBF8EF; color: black; margin-left: 20px; margin-top: 12px;">EmoMind</h2>-->
        </div>
        <div class="col-12 col-md-8 text-right"> <!-- Sử dụng text-right để đặt nội dung bên phải -->
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
              <a href="#" class="nav-item nav-link">Feedback</a>
            </div>
            <div class="navbar-nav ml-auto"> <!-- Sử dụng ml-auto để đặt "Sign In" bên phải -->
               <c:if test="${sessionScope.acc == null}"> 
                    <a href="login.jsp" class="nav-item nav-link ml-auto active "><i class="fas fa-user"></i> Sign In</a>
                    <a href="SignUp.jsp" class="nav-item nav-link ml-auto active "><i class="fas fa-user"></i> Sign Up</a>
                </c:if>     
                
                <c:if test="${sessionScope.acc != null}"> 
                    <a href="infor?username=${sessionScope.acc.username}" class="nav-item nav-link ml-auto active "><i class="fas fa-user"></i> Hello ${sessionScope.acc.username}</a>
                </c:if>       
            </div>
          </div>
          
       <!--
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav mx-auto"></div>
            <a href="index.html" class="nav-item nav-link active">Home</a>
            <a href="about.html" class="nav-item nav-link">About Us</a>
            <a href="contact.html" class="nav-item nav-link">Contact </a>
            <a href="classes.html" class="nav-item nav-link">Feedback</a>
            
                <div class="navbar-nav mx-auto"></div>
                <a href="#" class="nav-item nav-link ml-auto"><i class="fas fa-user"></i> Sign In</a>

                </div>

            -->
            
        </div>
    </nav>
     <h1 style="font-weight:bold;text-align: center;margin-top:10px;">  How are you today? </h1>
     <p style="margin-left:500px; font-size: larger;color:black;">Please fill in the form to better to understand together</p>
    <div class="login-container">
        
        <form action="#" method="post">
            <div style="color:black;font-size: larger;text-align: center; "> Let's Share your story!!!</div>
            <div class="form-group" style="margin-top: 10px; position: relative;">
                <input style="margin-left: 30px; margin-top: 20px; padding-right: 30px;" type="text" id="username" name="username" required >
                <i  href="#"class="fas fa-microphone" style="position: absolute; right: 10px; bottom: 10px;"></i>
            </div>
            
    
                    <div class="form-group row">
                        <button  href="#" class="col-12 col-md-6 " type="submit">Sign In</button>
                        <button href="#" class="col-12 col-md-6 " style="margin-left:20px;" type="submit">Sign Up</button>
                    </div>
                    
        
        </form>
    </div>
</body>
</html>
