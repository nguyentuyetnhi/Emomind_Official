<%-- 
    Document   : displayEmotions
    Created on : Oct 7, 2023, 9:02:28 PM
    Author     : tramy
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Emotions</title>
</head>
<body>
    <h1>Emotions:</h1>
    <ul>
        <% 
            String[] emotions = (String[]) request.getAttribute("emotions");
            for (String emotion : emotions) {
        %>
            <li><%= emotion %></li>
        <% } %>
    </ul>
</body>
</html>
