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
                <form action="DistpatchController">
                    <c:if test="${empty user}">
                        <h2 style="margin-top: 5%">Enter your Information To Buy</h2>
                        <table>
                            <tr>
                                <td>Enter your Name </td>
                                <td><input type="text" name="txtName" value="" required /></td>
                            </tr>
                            <tr>
                                <td>Enter your Email: </td>
                                <td><input type="text" name="txtEmail" value="" required /></td>
                            </tr>
                            <tr>
                                <td>Enter your Address: </td>
                                <td><input type="text" name="txtAddress" value="" required /></td>
                            </tr>
                            <tr>
                                <td>Enter your Phone Number: </td>
                                <td><input type="text" name="txtPhone" value="" required /></td>
                            </tr>
                            <tr>
                                <td>Discount Code: </td>
                                <td><input type="text" name="txtDiscount" value="" /></td>
                            </tr>
                        </table>
                    </c:if>
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

                        <tbody>
                            <c:set var="over" value="${requestScope.OVERQUANTITY}"/>
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
                                    <td data-th="Subtotal" class="text-center">${cartList.price * cartList.quantity}
                                        <span id="-${counter.count}" style="display: none;">${cartList.price * cartList.quantity}</span>
                                        <input type="hidden" name="txtPricee" value="${cartList.price * cartList.quantity}" />
                                    </td>
                                    <td class="actions" data-th="">
                                        <a href="${deleteCart}" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
                                            <c:set var="chkId" value="${counter.count}"/>
                                            <c:set var="subId" value="-${counter.count}"/>
                                        <input type="checkbox" id="${counter.count}" onclick="calTotal(${chkId}, ${subId})" name="txtchk" value="a"/>
                                        <c:forEach var="overLoad" items="${over}" varStatus="counter">
                                            <c:if test="${overLoad == cartList.id}">
                                                <span style="color: red">Your quantity is too Large</span>
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <!--                                    <td>-->

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
                                <td class="hidden-xs text-center"><strong>Total $ <span id="total">0</span></strong></td>
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

                <form action="DistpatchController">
                    Enter your Email to View Bill: <input type="text" name="txtBill" value="" />
                    <input type="submit" class="btn btn-info" name="btAction" value="View Shopping Bill" />
                </form>
            </c:if>
            <c:if test="${empty cart}">
                <h2>No Items in Cart</h2>
            </c:if>
        </c:if>
        <c:if test="${user.isAdmin == true}">
            <h1>You cannot access this Page</h1>
        </c:if>

        <script>
            var total = 0;
            function calTotal(chkId, subId) {
                var check = document.getElementById(chkId);
                var value = document.getElementById(subId);
                console.log(check.checked);
                console.log(value.innerHTML);
                if (check.checked == true) {
                    console.log('isNan: ' + isNaN(document.getElementById(subId).innerHTML))
                    total += parseInt(document.getElementById(subId).innerHTML);
                } else {
                    total -= parseInt(document.getElementById(subId).innerHTML);
                }
                document.getElementById('total').innerHTML = total;
            }

        </script>
</body>
</html>
