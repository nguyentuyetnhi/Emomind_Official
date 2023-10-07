<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8" session = "true"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="Head.jsp"></jsp:include>    
<body>
    <jsp:include page="Navbar.jsp"></jsp:include>
    <div class="login-container">
        <h2>Get Started</h2>
            <hr style="color:black;font-weight: bold;">
            <%        
        String uname= "", pass ="", reme ="";
        Cookie[] cookies = request. getCookies();
        if(cookies != null){
            for (Cookie cook : cookies){
                if (cook.getName().equals ("CookieName")){
                    uname = cook.getValue();
                } else if (cook.getName().equals("CookiePass")){
                    pass = cook.getValue();
                } else if (cook.getName().equals("cookieRemember")){
                    reme = cook.getValue();
                }        
            }
        }
%>
        <form action="login" method="post">
            <p style="color:red; text-align: center">${mess}</p>
            <div class="form-group" style="margin-top:30px;">              
                <input style=" font-size: x-small;" type="text" id="username" name="username" placeholder="Email or phone" value = "<%=uname %>" />
            </div>
            <div class="form-group" style="margin-top:30px;">      
                <input  style=" font-size: x-small;"type="text" id="password" name="password" placeholder ="Password" value = "<%=pass %>"/>
            </div>
            <div style="margin-left:-200px;">
           <input type="checkbox" id="rememberMe" name="rememberMe" value= "1" <%= "1".equals(reme) ?  "checked='/checked'" : "" %> />
                <label style="font-size: small;margin-top:-5px;" for="rememberMe">Remember Me</label>
                </div>
                <div style="font-size: x-small;margin-left:-220px; margin-top:10px;  "class="forgot-password">
                    <a href="email" style="color:rgb(51, 63, 222);">Forgot password</a>
                </div>
     
                <div class="form-group row">
                    <button class="col-12 col-md-6 " type="submit"><a style="color:black;"> Sign In </a></button>
                        
                    <button class="col-12 col-md-6 " style="margin-left:20px;" type="submit"><a href="SignUp.jsp" style="color:black;"> Sign Up </a></button>
                </div>       
        </form>
    </div>
</body>
</html>
