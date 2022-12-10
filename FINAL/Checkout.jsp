<%@ page language="java" contentType="text/html; ISO-8859-1"
         pageEncoding="iso-8859-1" %>
<<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://">
<html>
<head>
    <meta http-equiv="Content-Type"> content="text/html; charset=ISO-8859-1">
    <title>Checkout</title>
</head>
<body>
<fieldset>
    <legend> Customer Information</legend>
    <form method="post"
          action="ShoppingCartController?action=saveOrder">
        <table cellpadding="2" cellspacing="2">
            <tr>
                <td>Customer Name</td>
                <td><input type="text" name="customerName"></td>
            </tr>
            <tr>
                <td>Customer Address</td>
                <td><input type="text" name="customerAddress"></td>
            </tr>
        </table>
    </form>

</fieldset>
</body>
</html>

