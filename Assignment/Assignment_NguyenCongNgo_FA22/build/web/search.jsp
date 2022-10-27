<%-- Document : search Created on : Oct 10, 2022, 6:00:43 PM Author : Admin --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        <title>Search Page</title>
    </head>

    <body>

        <c:set var="user" value="${sessionScope.USER}" />
        <c:if test="${not empty sessionScope.USER && sessionScope.USER.isAdmin == true}">
            <c:set var="admin" value="true" />
        </c:if>
        <c:set var="note" value="${requestScope.ERROR}" />
        <!--<h2>${note}</h2>-->
        <c:set var="txtSearch" value="${requestScope.SEARCHVALUE}" />
        <c:set var="txtCategory" value="${param.txtCategory}" />
        <h2 style="color: red">${requestScope.UPDATESTATUS}</h2>
        <c:choose>
            <c:when test="${not empty user}">
                <h1>Welcome ${user.fullName}</h1>

            </c:when>
            <c:otherwise>
                <a href="login.html">
                    <h1>Login</h1>
                </a>
            </c:otherwise>
        </c:choose>
        <form action="DistpatchController">
            Enter Course: <input type="text" name="txtSearch" value="${txtSearch}" />
            <input type="submit" value="Search" name="btAction" />
            <span for="cars">Category</span>
            <select name="txtCategory">
                <c:choose>
                    <c:when test="${empty txtCategory}">
                        <option value="All">All</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${txtCategory}">${txtCategory}</option>
                    </c:otherwise>
                </c:choose>
                <c:forEach var="category" items="${applicationScope.CATEGORY}">
                    <c:choose>
                        <c:when test="${empty txtCategory && category != 'All'}">
                            <option value="${category}">${category}</option>
                        </c:when>
                        <c:when test="${not empty txtCategory && category != txtCategory}">
                            <option value="${category}">${category}</option>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </select>
            <c:if test="${not empty user}">
                <input type="submit" value="LogOut" name="btAction" />
            </c:if>
        </form>
        <c:if test="${empty user || user.isAdmin == false}">
            <a href="ViewCartController">View Cart</a>
        </c:if>
        <br>
        <c:if test="${admin == true}">
            <c:url var="update" value="ShowCourse">
            </c:url>
            <a href="${update}">
                <button type="button" class="btn">Update</button>
            </a>
            <c:url var="history" value="ShowHistory">
            </c:url>
            <a href="${history}">
                <button type="button" class="btn">View Update History</button>
            </a>
            <button type="button" class="btn btn-info btn" data-toggle="modal"
                    data-target="#myModal">Create</button>
            <!-- Modal -->
            <div class="modal fade" id="myModal${counter.count}" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Create Course: </h4>
                        </div>
                        <div class="modal-body">
                            <div class="update">
                                <form id="form" action="DistpatchController" method="POST">
                                    Name: <input id="nameOfCourse" required type="text" name="txtName" value=""> <span id="nameError"></span> <br>
                                    Image: <input type="text" name="txtImage" value=""> <br>
                                    Description: <input type="text" name="txtDescription" value=""> <br>
                                    Price: <input id="priceOfCourse" type="text" name="txtPrice" value=""> <span id="priceError"></span> <br>
                                    Quantity: <input id="quantityOfCourse" type="text" name="txtQuantity" value=""> <span id="quantityError"></span> <br>
                                    Start Date: <input id="startOfCourse" required type="date" id="startDate" name="txtStartDate"> <span id="startError"></span> <br>
                                    End Date: <input id="endOfCourse" required type="date" name="txtEndDate"> <span id="endError"></span> <br>
                                    Category:
                                    <select name="txtCategory">
                                        <c:forEach var="category" items="${applicationScope.CATEGORY}">
                                            <c:if
                                                test="${category != course.category && category != 'All'}">
                                                <option value="${category}">${category}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select> <br>
                                    <input type="hidden" id="true" name="txtStatus" value="true">
                                    <!--<span>False: </span><input type="radio" id="false" name="txtStatus"
                                                                                        value="false"> <br>-->
                                    <input type="hidden" name="txtSearch" value="${txtSearch}" />
                                    <input type="hidden" name="txtCategoryProduct" value="${txtCategory}" />
                                    <input type="submit" value="Create" name="btAction" />
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <br>
        <c:set var="courses" value="${requestScope.SEARCHRESULT}" />
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
                                    <c:if test="${user.isAdmin == false || empty user}">
                                    <th>Action</th>
                                    </c:if>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="course" items="${courses}" varStatus="counter">
                                <c:set var="page"
                                       value="${Double.valueOf((counter.count + 19) / 20).intValue()}" />
                                <%--<c:url var="update" value="">--%>

                                <%--< /c:url>--%>
                                <tr class="Page${page} course">
                                    <td>${counter.count}</td>
                                    <td>${course.name}</td>
                                    <td><img class="img-responsive" src="${course.image}" alt="">
                                    </td>
                                    <td>${course.description}</td>
                                    <td>${course.price}</td>
                                    <td>${course.quantity}</td>
                                    <td>${course.startDate}</td>
                                    <td>${course.endDate}</td>
                                    <td>${course.category}</td>
                                    <td>${course.status}</td>
                                    <c:if test="${user.isAdmin == false || empty user}">
                                        <c:url var="addToCart" value="AddToCartController">
                                            <c:param name="txtId" value="${course.id}" />
                                            <c:param name="txtUsername" value="${user.username}" />
                                            <c:param name="txtSearch" value="${txtSearch}"/>
                                            <c:param name="txtCategory" value="${txtCategory}" />
                                        </c:url>
                                        <td><a href="${addToCart}">Add to Cart</a></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <c:set var="paging" value="${requestScope.PAGING}" />
                <ul class="pagination">
                    <c:forEach var="pageNumber" begin="1" end="${paging}">
                        <li onclick="showPage(${pageNumber}, ${paging})"><a>${pageNumber}</a></li>
                            </c:forEach>
                </ul>
            </c:when>
            <c:otherwise>
                <c:if test="${requestScope.NULLDTO == true || requestScope.EMPTYSEARCH == true}">
                    <h3>No Record matched</h3>
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
//Check validation

            var form = document.getElementById("form");
            form.addEventListener('submit', (e) => {
                var nameCourse = document.getElementById("nameOfCourse").value;
                var price = parseInt(document.getElementById("priceOfCourse").value);
                var quantity = parseInt(document.getElementById("quantityOfCourse").value);
                var startDate = new Date(document.getElementById("startOfCourse").value);
                var endDate = new Date(document.getElementById("endOfCourse").value);
                var error = false;
                if (nameCourse.trim() == '') {
                    document.getElementById("nameError").innerHTML = "Not Empty here !!!";
                    error = true;
                } else {
                    document.getElementById("nameError").innerHTML = "";
                }
                if (isNaN(price)) {
                    document.getElementById("priceError").innerHTML = "Must Number here !!!";
                    error = true;
                } else {
                    document.getElementById("priceError").innerHTML = "";
                }
                if (isNaN(quantity)) {
                    document.getElementById("quantityError").innerHTML = "Must Number here !!!";
                    error = true;
                } else {
                    if (quantity <= 0) {
                        document.getElementById("quantityError").innerHTML = "Quantity must be > 0";
                        error = true;
                    } else {
                        document.getElementById("quantityError").innerHTML = "";
                    }
                }
                if (startDate - endDate >= 0 || startDate == null || endDate == null) {
                    document.getElementById("endError").innerHTML = "End Date must be After Start Date";
                    error = true;
                } else {
                    document.getElementById("endError").innerHTML = "";
                }
                if (error) {
                    e.preventDefault();
                }
            })
        </script>
    </body>

</html>