<%@ page import="java.sql.*"%>
<%@ page import="java.math.BigDecimal" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<!DOCTYPE html>

<html>
<head>
    <title>Snack</title>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<!-----------------------------MENU BAR (START)------------------------------------------->
<header>
    <div class="logo-container">
        <img src="./images/logo.jpg" alt="">
        <h4 class="logo">GreenMart</h4>
    </div>

    <nav>
        <ul class="nav-links-right">
            <li class="nav-link"><a href="HomePage.jsp">Categories </a></li>
            <li class="nav-link"><a href="Signout.html">Sign Out </a></li>
            <li class="nav-link"><a href="Cart.jsp">Shopping Cart </a></li>
        </ul>
    </nav>
    <!-----------------------------MENU BAR (END)---------------------------------------------->

</header>

<table border="1">
    <thead>
    <tr>
        <th>Product</th>
        <th>Photo</th>
        <th width="500px">Description</th>
        <th width="80px">Price</th>
        <th>Add items</th>
    </tr>
    </thead>

    <tbody>
    <%
        String db = "vu";
        String user; // assumes database name is the same as username
        user = "root";
        String password = "password";

        if(request.getParameter("addToCart")!=null) {
            session.setAttribute(request.getParameter("addToCart"), true);
        }


        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenMart?autoReconnect=true&useSSL=false", user, password);

        Statement stmt = con.createStatement();

        ResultSet rs = stmt.executeQuery("Select ProductID, PName, Photo, Description, Price from products where CategoryID = 10");
        while(rs.next()){
            int ProductID = rs.getInt("ProductID");
            String PName = rs.getString("PName");
            String Photo = rs.getString("Photo");
            String Description = rs.getString("Description");
            BigDecimal Price = rs.getBigDecimal("Price");

    %>
    <tr>

        <td><%=PName%></td>

        <td><img class="item-image" src = <%=Photo%>></td>

        <td><%=Description%></td>

        <td><%=Price%></td>

        <td><form action="Snack.jspp">

            <input type="hidden" name="addToCart" value="<%=ProductID%>">
            <input type="submit" value="Add">
        </form></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>

</html>