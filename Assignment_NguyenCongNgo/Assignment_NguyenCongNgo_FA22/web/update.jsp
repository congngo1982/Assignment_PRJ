<%-- 
    Document   : update
    Created on : Oct 14, 2022, 3:30:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="Cache-Control" content="no-cache">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="styleSearch.css">
        <title>Update Page</title>
    </head>
    <body>

        <c:set var="user" value="${sessionScope.USER}"/>
        <c:if test="${not empty sessionScope.USER && sessionScope.USER.isAdmin == true}">
            <c:set var="admin" value="true" />
        </c:if>
        <h2 style="color: red">${requestScope.UPDATESTATUS}</h2>
        <c:choose>
            <c:when test="${not empty user}">
                <h1>Welcome ${user.fullName}</h1>
            </c:when>
            <c:otherwise>
                <a href="login.html"><h1>Login</h1></a>
            </c:otherwise>
        </c:choose>
        <a href="search.jsp">Search Page</a>

        <c:set var="courses" value="${requestScope.LISTCOURSE}"/>
        <c:choose>
            <c:when test="${not empty courses}">
                <div class="tableStyle">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="no">No.</th>
                                <th class="name">Name</th>
                                <th>Image</th>
                                <th class="description">Description</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Category</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="course" items="${courses}" varStatus="counter">
                                <c:set var="page" value="${Double.valueOf((counter.count + 19) / 20).intValue()}"/>
                                <tr class="Page${page} course">
                                    <td>${counter.count}</td>
                                    <td>${course.name}</td>
                                    <td><img class="img-responsive" src="${course.image}" alt=""></td>
                                    <td>${course.description}</td>
                                    <td>${course.price}</td>
                                    <td>${course.quantity}</td>
                                    <td>${course.startDate}</td>
                                    <td>${course.endDate}</td>
                                    <td>${course.category}</td>
                                    <td>${course.status}</td>
                                    <c:if test="${not empty admin}">
                                        <td>
                                            <button type="button" class="btn btn-info btn" data-toggle="modal" data-target="#myModal${counter.count}">Update</button>
                                        </td>
                                        <!-- Modal -->
                                <div class="modal fade" id="myModal${counter.count}" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Update: ${course.name}</h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="update">
                                                    <form id="form" action="DistpatchController" method="POST">
                                                        Name: <input id="name" type="text" name="txtName" value="${course.name}" required>
                                                        <span id="errorName"></span>
                                                        <br>
                                                        Image: <input type="text" name="txtImage" value="${course.image}"> <br>
                                                        Description: <input type="text" name="txtDescription" value="${course.description}"> <br>
                                                        Price: <input id="price" type="text" name="txtPrice" value="${course.price}" required> 
                                                        <span id="errorPrice"></span>
                                                        <br>
                                                        Quantity: <input id="quantity" type="text" name="txtQuantity" value="${course.quantity}" required> 
                                                        <span id="errorQuantity"></span>
                                                        <br>
                                                        Start Date: <input id="startDate" type="text" name="txtStartDate" value="${course.startDate}" required> 
                                                        <span id="errorStart"></span>
                                                        <br>
                                                        End Date: <input id="endDate" type="text" name="txtEndDate" value="${course.endDate}" required> 
                                                        <span id="errorEnd"></span>
                                                        <br>
                                                        Category: 
                                                        <select name="txtCategory">
                                                            <option value="${course.category}">${course.category}</option>
                                                            <c:forEach var="category" items="${applicationScope.CATEGORY}">
                                                                <c:if test="${category != course.category && category != 'All'}">
                                                                    <option value="${category}">${category}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select> <br>
                                                        Status: 
                                                        <span>True: </span><input type="radio" id="true" name="txtStatus" value="true" <c:if test="${course.status == true}">checked="checked"</c:if>>
                                                            <span>False: </span><input type="radio" id="false" name="txtStatus" value="false" <c:if test="${course.status == false}">checked="checked"</c:if> > <br>
                                                            <input type="hidden" name="txtSearch" value="${txtSearch}" />
                                                        <input type="hidden" name="txtCategoryProduct" value="${txtCategory}" />
                                                        <input type="hidden" name="txtId" value="${course.id}" />
                                                        <input type="submit" value="Update" name="btAction" />
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <c:set var="paging" value="${requestScope.PAGING}"/>
                <ul class="pagination">
                    <c:forEach var="pageNumber" begin="1" end="${paging}">
                        <li onclick="showPage(${pageNumber}, ${paging})"><a>${pageNumber}</a></li>
                            </c:forEach>
                </ul>
            </c:when>
            <c:otherwise>
                <c:if test="${empty LISTCOURSE}">
                    <h3>No Record</h3>
                </c:if>
            </c:otherwise>
        </c:choose>





        <script>
            //            if (window.history.replaceState) {
            //                window.history.replaceState(null, null, window.location.href);
            //            }

            for (var i = 0; i < document.getElementsByClassName("Page" + 1).length; i++) {
                document.getElementsByClassName("Page1")[i].style.display = 'table-row';
            }
            function showPage(page, number) {

                for (var i = 0; i < document.getElementsByClassName("Page" + page).length; i++) {
                    document.getElementsByClassName("Page" + page)[i].style.display = 'table-row';
                }
                for (var i = 1; i <= number; i++) {
                    if (i != page) {
                        for (var j = 0; j < document.getElementsByClassName("Page" + i).length; j++) {
                            document.getElementsByClassName("Page" + i)[j].style.display = 'none';
                        }
                    }

                }
            }
            console.log("Date: " + new Date(document.getElementById("startDate").value))
            // Check Validation
            var form = document.getElementById("form");
            form.addEventListener('submit', (e) => {
                var nameCourse = document.getElementById("name").value;
                var price = parseInt(document.getElementById("price").value);
                var quantity = parseInt(document.getElementById("quantity").value);
                var startDate = new Date(document.getElementById("startDate").value);
                var endDate = new Date(document.getElementById("endDate").value);
                var error = false;
                if (nameCourse.trim() == '') {
                    document.getElementById("errorName").innerHTML = "Not Empty here !!!";
                    error = true;
                } else {
                    document.getElementById("errorName").innerHTML = "";
                }
                if (isNaN(price)) {
                    document.getElementById("errorPrice").innerHTML = "Must Number here !!!";
                    error = true;
                } else {
                    document.getElementById("errorPrice").innerHTML = "";
                }
                if (isNaN(quantity)) {
                    document.getElementById("errorQuantity").innerHTML = "Must Number here !!!";
                    error = true;
                } else {
                    if (quantity < 0) {
                        document.getElementById("errorQuantity").innerHTML = "Quantity must be >= 0";
                        error = true;
                    } else {
                        document.getElementById("errorQuantity").innerHTML = "";
                    }
                }
                if (startDate - endDate >= 0 || startDate == null || endDate == null) {
                    document.getElementById("errorEnd").innerHTML = "End Date must be After Start Date";
                    error = true;
                } else {
                    document.getElementById("errorEnd").innerHTML = "";
                }
                if (error) {
                    e.preventDefault();
                }
            })
        </script>
    </body>
</html>
