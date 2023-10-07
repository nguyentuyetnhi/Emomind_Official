<%-- 
    Document   : login
    Created on : Oct 7, 2023, 12:52:09 PM
    Author     : tramy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="login" method="post">
    <input type="text" name="user_id" placeholder="Username">
    <input type="password" name="password" placeholder="Password">
    <button class="btn btn-primary login-btn" type="submit">LOGIN</button>
</form>
    </body>
</html>
