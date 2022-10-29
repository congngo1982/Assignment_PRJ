<%-- 
    Document   : viewUpdateHistory
    Created on : Oct 23, 2022, 8:21:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="styleSearch.css">
        <title>Update History Page</title>
    </head>
    <body>
        <h1>Update History Page</h1>
        <a href="search.jsp">
                <button type="button" class="btn">Home</button>
            </a>
        <c:set var="user" value="${sessionScope.USER}"/>
        <c:if test="${not empty user}">
            <c:set var="updateList" value="${requestScope.UPDATEHISTORY}"/>
            <div class="tableStyle">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Member</th>
                            <th>CourseName</th>
                            <th>Update Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" items="${updateList}" varStatus="counter">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${list.fullname}</td>
                                <td>${list.courseName}</td>
                                <td>${list.updateDate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </body>
</html>
