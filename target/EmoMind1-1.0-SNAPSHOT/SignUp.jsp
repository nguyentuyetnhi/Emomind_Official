<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <jsp:include></jsp:include>
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
                <div class="col-12 col-md-8 text-right"> <!-- S? d?ng text-right ?? ??t n?i dung bên ph?i -->
                    <!---   <a href="mailto:ntnhi2023@gmail.com">ntnhi2023@gmail.com</a>-->
                </div>
            </div>


            <jsp:include page="Navbar.jsp"></jsp:include>
        </div>
    <div class="login-container">
        <h2>Get Started</h2>
        <hr style="color:black;font-weight: bold;">
        <form action="signup" method="post" enctype="multipart/form-data">
            <p style="color:red; text-align: center">${mess}</p>
            <div class="form-group" style="margin-top:30px;">              
                <input style=" font-size: x-small;" type="text" id="username" name="username" placaholder="Email or phone">
            </div>
            <div class="form-group" style="margin-top:30px;">

                <input  style=" font-size: x-small;"type="text" id="password" name="password" placaholder="Password">
            </div>
            <div style="margin-left:-200px;">
                <input type="checkbox" id="rememberMe" name="rememberMe">
                <label style="font-size: small;margin-top:-5px;" for="rememberMe">Remember Me</label>
            </div>
            <div style="font-size: x-small;margin-left:-220px; margin-top:10px;  "class="forgot-password">
                <a href="#" style="color:rgb(51, 63, 222);">Forgot password</a>
            </div>

            <div class="form-group row">
                <button class="col-12 col-md-6 " type="submit"><a href = "login.jsp" style="color:black;"> Sign In </a></button>

                <button class="col-12 col-md-6 " style="margin-left:20px;" type="submit"><a style="color:black;"> Sign Up </a></button>
            </div>       
        </form>
    </div>
</body>
</html>
