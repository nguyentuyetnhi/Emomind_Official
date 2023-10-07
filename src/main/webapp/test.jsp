<%-- 
    Document   : test
    Created on : Oct 6, 2023, 10:11:44 AM
    Author     : tramy
--%>

<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="usage-status" method="get">
            <c:forEach var="user" items="${usageData}">
                User ID: ${user.user_id}</br>
                Frequency of used: ${user.frequency}</br>
                 Usage race in a month:  </br>
            </c:forEach>
        </form>
    </body>
</html>
