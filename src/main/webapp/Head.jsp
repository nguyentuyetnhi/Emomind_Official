<%-- 
    Document   : Head
    Created on : Oct 7, 2023, 12:53:27 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="resourcePath" value="${pageContext.request.contextPath}" scope="application"/>
<!DOCTYPE html>
<html>
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
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
            }
            .login-container {
                width: 410px;
                height:467px;
                border-radius: 10%;
                margin: 0 auto;
                margin-top: 70px;
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
                width: 350px;
                height:50px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 10px;
            }
            .form-group button {
                width: 30%;
                height:40px;
                padding: 10px;
                background-color:#fff;
                color: back;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                font-size: small;
                margin-top:50px;
                margin-left:70px;

            }
        </style>
    </head>
</html>

