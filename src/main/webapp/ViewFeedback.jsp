<%-- 
    Document   : ViewFeedback
    Created on : Oct 7, 2023, 3:42:18 PM
    Author     : ASUS
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>EmoMind Website</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@600&family=Lobster+Two:wght@700&display=swap" rel="stylesheet">

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
        <style>
            /*FEEDBACK*/
            .feedback p {
                margin: 0;
            }
            .feedback-user {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .feedback-user-icon {
                padding-top: 30px;
                font-size: 200px;
            }

            .feedback-user button {
                padding: 10px;
                border-radius: 15px;
                border: none;
                background-color: #f8d57e;
            }

            .feedback-title {
                padding-top: 30px;
                display: flex;
                justify-content: center;
            }

            .feedback-content-items {
                padding: 10px 40px;
                margin-bottom: 20px;
                background-color: white;
                border-radius: 20px;
                height: auto;
            }
            .feedback-content-item {
                padding-bottom: 5px;
            }

            .feedback-content-items .feedback-content-icon {
                display: flex;
                justify-content: flex-end;
            }
            .feedback-content-icon i {
                padding: 0 10px;
            }

            body {
                background-color: #fbf8ef;
                overflow-x: hidden;
            }
            nav {
                background-color: #3b9bdb;
            }
            .static-image {
                position: absolute;
                top: 0;
                left: 0;
            }

            .moving-image-1 {
                position: absolute;
                top: 0;
                left: -50px; /* Đặt vị trí bên trái hình ảnh đầu */
            }

            .moving-image-2 {
                position: absolute;
                top: 200px; /* Đặt vị trí dưới hình ảnh đầu */
                left: 0;
            }

            .navbar-nav a {
                text-decoration: none;
                transition: background-color 0.3s;
                border-radius: 20px;
            }

            .navbar-nav a:hover {
                background-color: #ffffff;
                /* Màu nền khi di chuột qua */
            }
            /*FEEDBACK*/
            .feedback p {
                margin: 0;
            }
            .feedback-user {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .feedback-user-icon {
                padding-top: 30px;
                font-size: 200px;
            }

            .feedback-user button {
                padding: 10px;
                border-radius: 15px;
                border: none;
                background-color: #f8d57e;
                color: white;
            }

            .feedback-user button:hover {
                background-color: var(--primary);
            }

            .feedback-title {
                padding-top: 30px;
                display: flex;
                justify-content: center;
            }

            .feedback-content-items {
                padding: 10px 40px;
                margin-bottom: 20px;
                background-color: white;
                border-radius: 20px;
                height: auto;
            }
            .feedback-content-item {
                padding-bottom: 5px;
            }

            .feedback-content-items .feedback-content-icon {
                display: flex;
                justify-content: flex-end;
            }
            .feedback-content-icon i {
                padding: 0 10px;
            }

            .info-content {
                margin: 30px 0;
                background-color: white;
                border-radius: 15px;
                padding: 20px 20px;
            }

            .info-content-items {
                display: flex;
                background-color: #f4f0cc;
                padding: 10px 20px;
                border-radius: 20px;
                font-weight: 400;
                font-size: 18px;
                margin: 20px;
            }
            .info-content-item {
                align-items: center;
                margin: 0;
                padding: 5px 0;
            }

            .btn-controll-info {
                border-radius: 10px;
                border: none;
                padding: 10px 20px;
                float: right;
                margin-left: 20px;
            }

            .search-input {
                display: flex;
                align-items: center;
                justify-content: center;
            }
        </style>
    </head>
    <body>
        <!-- <div class="container"> -->
        <div class="row">
            <div class="col-12 col-md-4">
                <img  style=" width:200px;
                      height:50px; margin-top:20px;margin-left:10px;"class="logo" src="img/Group 1.png">
                <!--<h2 style="background-color: #FBF8EF; color: black; margin-left: 20px; margin-top: 12px;">EmoMind</h2>-->
            </div>
            <div class="col-12 col-md-8 text-right"> <!-- Sử dụng text-right để đặt nội dung bên phải -->
                <!---   <a href="mailto:ntnhi2023@gmail.com">ntnhi2023@gmail.com</a>-->
            </div>
        </div>
        <!-- start nav -->
        <nav class="navbar navbar-expand bg navbar-light sticky-top px-2px-lg-3 py-lg-0" style="background-color: #FCECB2 ">
            <a href="index.html" class="navbar-brand">

            </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div  style="margin-left:50px;" class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav">
                    <a href="index.html" class="nav-item nav-link ">Home</a>
                    <a href="about.html" class="nav-item nav-link">About Us</a>
                    <a href="contact.html" class="nav-item nav-link">Contact</a>
                    <a href="ViewFeedbackServlet" class="nav-item nav-link">Feedback</a>
                </div>
                <div class="navbar-nav ml-auto"> <!-- S? d?ng ml-auto ?? ??t "Sign In" bên ph?i -->
                    <c:if test="${sessionScope.acc == null}"> 
                        <a href="login.jsp" class="nav-item nav-link ml-auto active "><i class="fas fa-user"></i> Sign In</a>
                        <a href="SignUp.jsp" class="nav-item nav-link ml-auto active "><i class="fas fa-user"></i> Sign Up</a>
                    </c:if>         

                    <c:if test="${sessionScope.acc != null}"> 
                        <a href="infor?username=${sessionScope.acc.username}" class="nav-item nav-link ml-auto active "><i class="fas fa-user"></i> Hello ${sessionScope.acc.username}</a>
                    </c:if>       
                </div>
            </div>



        </nav>
        <!-- end nav -->

        <div class="container">
            <div class="row feedback">
                <div class="col-md-5 feedback-user">
                    <img src="img/${sessionScope.acc.img}" alt ="No picture added yet!" height="200" width="200">
                    <p>ID:${sessionScope.acc.id}</p>
                    <h2 class="feedback-nameuser">${sessionScope.acc.username}</h2>
                    <button><a href="SendFeedback.jsp"><i class="fa fa-plus"></i>  NEW FEEDBACK</a></button>
                </div>
                <div class="col-md-7 feedback-content">
                    <h5 class="feedback-title">Say something with us</h5>
                    <c:forEach var="feedback" items="${feedbackList}">
                        <div class="feedback-content-items">
                            <p class="feedback-userid">ID: ${sessionScope.acc.id}</p>
                            <p class="feedback-content-item">
                                ${feedback.message}
                            </p>
                            <div class="feedback-content-icon">
                                <i class="fa fa-thumbs-up"></i>
                                <i class="fa fa-heart"></i>
                                <i class="fa fa-comment"></i>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>


        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h3 class="text-white mb-4">Get In Touch</h3>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h3 class="text-white mb-4">Quick Links</h3>
                        <a class="btn btn-link text-white-50" href="">About Us</a>
                        <a class="btn btn-link text-white-50" href="">Contact Us</a>
                        <a class="btn btn-link text-white-50" href="">Our Services</a>
                        <a class="btn btn-link text-white-50" href="">Privacy Policy</a>
                        <a class="btn btn-link text-white-50" href="">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h3 class="text-white mb-4">Photo Gallery</h3>
                        <div class="row g-2 pt-2">
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/classes-1.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/classes-2.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/classes-3.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/classes-4.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/classes-5.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/classes-6.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h3 class="text-white mb-4">Newsletter</h3>
                        <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved. 
                            Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- </div> -->


        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
