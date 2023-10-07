<%-- 
    Document   : SearchMethod
    Created on : Oct 7, 2023, 8:30:42 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
</head>

<body>
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg navbar-light sticky-top px-2px-lg-3 py-lg-0" style="background-color: #FCECB2 ">
            <a href="index.html" class="navbar-brand">
               
            </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div  style="margin-left:50px;"class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav">
                  <a href="index.html" class="nav-item nav-link active">Home</a>
                  <a href="about.html" class="nav-item nav-link">About Us</a>
                  <a href="contact.html" class="nav-item nav-link">Contact</a>
                  <a href="viewFeedback.html" class="nav-item nav-link">Feedback</a>
                </div>
                <div class="navbar-nav ml-auto"> <!-- Sử dụng ml-auto để đặt "Sign In" bên phải -->
                  <a href="login.html" class="nav-item nav-link ml-auto "><i class="fas fa-user"></i> Sign In</a>
                </div>
              </div>
            </div>
        </nav>
        <!-- Navbar End -->


        <!-- start Search -->
        <div class="container row">
            <div class="mt-3 row col-12">
                <div class="col-6"></div>
                <form method="post" action="search" class="form-inline col-4">
                    <div class="form-group d-flex w-100">
                        <input type="text" class="form-control mx-1" placeholder="What are you looking for...?">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </form>
                <div class="col-2"></div>
            </div>
            <div class="mt-3 row col-12">
                <h5 class="text-center text-result">GIVE YOU SOME ENERGY!!</h5>
                <div class="container mt-3 row d-flex justify-content-center">
                    <c:forEach var="itemMethod" items="${itemMethodList}">
                        <div class="card col-3 m-4" style="width: 15rem;">
                        <img src="https://via.placeholder.com/150" class="w-100" alt="Ảnh Card">
                        <div class="card-body">
                            <h5 class="card-title">${itemMethod.MethodName}</h5>
                            <p class="card-text">${itemMethod.ID}</p>
                            <a href="${itemMethod.Link}" class="btn btn-primary">Detail</a>
                        </div>
                    </div>
                    </c:forEach>
<!--                    <div class="card col-3 m-4" style="width: 15rem;">
                        <img src="https://via.placeholder.com/150" class="w-100" alt="Ảnh Card">
                        <div class="card-body">
                            <h5 class="card-title">Title</h5>
                            <p class="card-text">Content in here</p>
                            <a href="#" class="btn btn-primary">Detail</a>
                        </div>
                    </div>
                    <div class="card col-3 m-4" style="width: 15rem;">
                        <img src="https://via.placeholder.com/150" class="w-100" alt="Ảnh Card">
                        <div class="card-body">
                            <h5 class="card-title">Title</h5>
                            <p class="card-text">Content in here</p>
                            <a href="#" class="btn btn-primary">Detail</a>
                        </div>
                    </div>
                    <div class="card col-3 m-4" style="width: 15rem;">
                        <img src="https://via.placeholder.com/150" class="w-100" alt="Ảnh Card">
                        <div class="card-body">
                            <h5 class="card-title">Title</h5>
                            <p class="card-text">Content in here</p>
                            <a href="#" class="btn btn-primary">Detail</a>
                        </div>
                    </div>-->
                </div>
            </div>
        </div>
        <!-- end Search -->
        
        <!-- Footer Start -->
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
							
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
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
        <!-- Footer End -->
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    <!-- </div> -->

    <!-- JavaScript Libraries -->
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
