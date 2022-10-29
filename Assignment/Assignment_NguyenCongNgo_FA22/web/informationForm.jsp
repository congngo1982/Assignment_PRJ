<%-- 
    Document   : informationForm
    Created on : Oct 27, 2022, 9:49:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Information Page</title>
    </head>
    <body>
        <h1>Hello <3</h1>
        <form action="DistpatchController" method="POST">
            Enter your Email: <input type="text" name="txtEmail" value="" /> <br>
            Enter your Address: <input type="text" name="txtAddress" value="" /> <br>
            Enter your Phone Number: <input type="text" name="txtPhone" value="" /> <br>
            Discount Code: <input type="text" name="txtdiscount" value="" /> <br>
            
        </form>
    </body>
</html>
