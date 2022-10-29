<%-- 
    Document   : shopping
    Created on : Oct 23, 2022, 9:57:39 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="styleSearch.css">
        <title>Shopping Page</title>
    </head>
    <body>
        <h1>Your Bill</h1>
        <a href="search.jsp">
            <button type="button" class="btn">Home</button>
        </a>
        <a href="ViewCartController">
            <button type="button" class="btn">Your Cart</button>
        </a>
        <c:set var="shoppingList" value="${requestScope.SHOPPING}"/>
    <div class="tableStyle">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Course</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Shopping Date</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${shoppingList}" varStatus="counter">
                <tr>
                    <td>${counter.count}</td>
                    <td>${list.fullname}</td>
                    <td>${list.courseName}</td>
                    <td>${list.quantity}</td>
                    <td>${list.price}</td>
                    <td>${list.date}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
