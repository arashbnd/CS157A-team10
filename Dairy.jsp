
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<!DOCTYPE html>

<html>
<head>
    <title>Dairy</title>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<!-----------------------------MENU BAR (START)------------------------------------------->
<header>
    <div class="logo-container">
        <img src="./images/logo.jpg" alt="">
        <h4 class="logo">GreenMart</h4>
    </div>
    <!--- SEARCH BAR (START)--------------------------------------------------------------------->
    <div class="topnav">
        <div>
            <form action = "./actionSearch.php" method = "post">
                <input type="text" placeholder="Search your item..." name="searchItem" >
                <button type="submit" class ="submit-button" ><i class="fa fa-search"></i></button>
            </form>
        </div>
    </div>
    <!--- SEARCH BAR (END)--------------------------------------------------------------------------------->

    <nav>
        <ul class="nav-links-right">
            <li class="nav-link"><a href="categories.html">Categories </a></li>
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
        <th>Discription</th>
        <th>Price</th>
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

        ResultSet rs = stmt.executeQuery("Select* from products where CategoryID = 4");
        while(rs.next()){

    %>
    <tr>

        <td><%=rs.getString("Pname")%></td>

        <td><%=rs.getString("Description")%></td>

        <td><%=rs.getString("Price")%></td>

        <td><form action="Dairy.jsp">
            <input type="hidden" name="addToCart" value="<%=rs.getString("ProductID")%>">
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
