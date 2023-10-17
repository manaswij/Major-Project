<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Personal page</title>
</head>
<body>
    <h1>Welcome to the personal page<%= request.getAttribute("userLogin") %></h1>
</body>
</html>
