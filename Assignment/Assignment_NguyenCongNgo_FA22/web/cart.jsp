<%-- 
    Document   : cart
    Created on : Oct 17, 2022, 3:23:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <title>Cart Page</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.USER}"/>
        <c:if test="${empty user || user.isAdmin == false}">
            <c:choose>
                <c:when test="${not empty user}">
                    <h1>Hello ${user.fullName}</h1>
                    <c:set var="cart" value="${requestScope.CART}"/>
                </c:when>
                <c:otherwise>
                    <c:set var="cart" value="${requestScope.CART}"/>
                </c:otherwise>
            </c:choose>
            <div class="container">
                <table id="cart" class="table table-hover table-condensed">
                    <thead>
                        <tr>
                            <th style="width:50%">Course</th>
                            <th style="width:10%">Price</th>
                            <th style="width:8%">Quantity</th>
                            <th style="width:22%" class="text-center">Subtotal</th>
                            <th style="width:10%">Action</th>
                        </tr>
                    </thead>
                    <form action="DistpatchController">
                        <tbody>
                            <c:forEach var="cartList" items="${cart}" varStatus="counter">
                                <c:url var="deleteCart" value="DeleteCartController">
                                    <c:param name="txtUsername" value="${user.username}"/>
                                    <c:param name="txtId" value="${cartList.id}"/>
                                </c:url>


                                <tr id="yourCart">
                                    <td data-th="Product">
                                        <div class="row">
                                            <div class="col-sm-2 hidden-xs"><img src="${cartList.image}" alt="..." class="img-responsive"/></div>
                                            <div class="col-sm-10">
                                                <h4 class="nomargin">${cartList.name}</h4>
                                                <input type="hidden" name="txtId" value="${cartList.id}" />
                                                <p>${cartList.description}</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td data-th="Price">$ ${cartList.price}</td>
                                    <td data-th="Quantity">
                                        <c:url var="minusCart" value="UpdateCartController">
                                            <c:param name="txtId" value="${cartList.id}"/>
                                            <c:param name="txtQuantity" value="-1"/>
                                        </c:url>
                                        <c:url var="plusCart" value="UpdateCartController">
                                            <c:param name="txtId" value="${cartList.id}"/>
                                            <c:param name="txtQuantity" value="1"/>
                                        </c:url>
                                        <a href="${minusCart}"><span class="glyphicon glyphicon-minus"></span></a>
                                        <input type="hidden"  name="txtQuantity" value="${cartList.quantity}">
                                        <span style="border: 1px solid green; border-radius: 2px; margin-left: 2px; margin-right: 2px; padding-left: 5px; padding-right: 5px">${cartList.quantity}</span>
                                        <a href="${plusCart}"><span class="glyphicon glyphicon-plus"></span></a>
                                    </td>
                                    <td data-th="Subtotal" class="text-center">$ ${cartList.price * cartList.quantity}
                                        <input type="hidden" name="txtPricee" value="${cartList.price * cartList.quantity}" />
                                    </td>
                                    <td class="actions" data-th="">
                                        <a href="${deleteCart}" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
                                        <input type="checkbox" name="txtchk" value="a" />
                                    </td>
                                    <td>

                                </tr>


                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <!--                    <tr class="visible-xs">
                                                    <td class="text-center"><strong>Total 1.99</strong></td>
                                                </tr>-->
                            <tr>
                                <td><a href="search.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                                <td colspan="2" class="hidden-xs"></td>
                                <td class="hidden-xs text-center"><strong>Total $ ${requestScope.TOTAL}</strong></td>
                                <td>
                                    <input  class="btn btn-success btn-block" type="submit" value="Checkout" name="btAction" />
                                </td>
                            </tr>
                        </tfoot>
                    </form>

                </table>
                <c:if test="${not empty user}">
                    <a href="ViewShopping" class="btn btn-success">Your Shopping Bill <i class="fa fa-angle-right"></i></a>
                    </c:if>
                    <c:if test="${empty user}">


                    <!-- Modal -->
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">View Shopping Bill</button>
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Information</h4>
                                </div>
                                <div class="modal-body">
                                    <form action="DistpatchController" method="POST">
                                        Enter your Email: <input type="text" name="txtEmail" value="" /> <br>
                                        Enter your Address: <input type="text" name="txtAddress" value="" /> <br>
                                        Enter your Phone Number: <input type="text" name="txtPhone" value="" /> <br>
                                        Discount Code: <input type="text" name="txtdiscount" value="" /> <br>
                                    </form>
                                </div>

                            </div>

                        </div>
                    </div>
                </c:if>
                <c:if test="${empty cart}">
                    <h2>No Items in Cart</h2>
                </c:if>
            </c:if>
            <c:if test="${user.isAdmin == true}">
                <h1>You cannot access this Page</h1>
            </c:if>
    </body>
</html>
