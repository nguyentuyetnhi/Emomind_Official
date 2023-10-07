<%-- 
    Document   : user
    Created on : Oct 7, 2023, 12:53:50 PM
    Author     : tramy
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        
        <p>User ID: ${user.user_id}</p>
        <p>Frequency of used: ${user.login_count}</p>
        <p>Usage race in a month: ${user.monthlyUsageRate}%</p> 
        
    </body>
</html>
