<%-- 
    Document   : login
    Created on : Oct 10, 2022, 4:25:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>LOGIN - PAGE</h1>
        <c:set var="txtUsername" value="${requestScope.txtUsername}"/>
        <c:set var="txtPassword" value="${requestScope.txtPassword}"/>
        <form action="DistpatchController" method="POST">
            Enter username: <input type="text" name="txtUsername" value="${txtUsername}" /> <br>
            Enter password: <input type="password" name="txtPassword" value="${txtPassword}" /> <br>

            <c:set var="error" value="${requestScope.ERROR}"/>
            <c:if test="${error == 'You must Login to Update' || error == 'Invalid Username or Password !!!'}">
                <div style="display: none">
                    <input type="hidden" name="txtId" value="${param.txtId}" />
                    <input type="hidden" name="txtName" value="${param.txtName}"> <br>
                    <input type="hidden" name="txtImage" value="${param.txtImage}"> <br>
                    <input type="hidden" name="txtDescription" value="${param.txtDescription}"> <br>
                    <input type="hidden" name="txtPrice" value="${param.txtPrice}"> <br>
                    <input type="hidden" name="txtQuantity" value="${param.txtQuantity}"> <br>
                    <input type="hidden" name="txtStartDate" value="${param.txtStartDate}"> <br>
                    <input type="hidden" name="txtEndDate" value="${param.txtEndDate}"> <br>
                    <input type="hidden" name="txtCategory" value="${param.txtCategory}"> <br>
                    <input type="hidden" name="txtStatus" value="${param.txtStatus}"> <br>
                    <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
                    <input type="hidden" name="txtCategoryProduct" value="${param.txtCategoryProduct}" />
                    <input type="hidden" name="update" value="true" />
                </div>
            </c:if>

            <input type="submit" value="Login" name="btAction" /> <br>
        </form>
        <h2 style="color: red">${requestScope.ERROR}</h2>
    </body>
</html>
