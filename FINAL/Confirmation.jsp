<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.math.BigDecimal" %>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Grocery Store</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500&display=swap" rel="stylesheet">

</head>
<body>
<!-----------------------------MENU BAR (START)------------------------------------------->
<header>
    <div class="logo-container">
        <img src="./img/logo.jpg" alt="">
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
            <li class="nav-link"><a href="HomePage.jsp">Categories</a></li>
            <li class="nav-link"><a href="Signout.html">Sign Out</a></li>
            <li class="nav-link"><a href="Cart.jsp">Shopping Cart</a></li>
        </ul>
    </nav>
    <!-----------------------------MENU BAR (END)---------------------------------------------->

</header>

<br>
<br>
<div class="main-text">
    <h1>Order Confirmation</h1>
</div>

<%
    String user; // assumes database name is the same as username
    user = "root";
    String password = "password";
//    try {



        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenMart?autoReconnect=true&useSSL=false",user, password);


        Statement stmt0 = con.createStatement();
        ResultSet rs0 = stmt0.executeQuery("select max(OrderId)+1 mxOrdId from `Order`");
        rs0.next();
        int mxOrdId = rs0.getInt("mxOrdId");

        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = formatter.format(date);

        Statement stmt1 = con.createStatement();
        String q1 = "insert into `Order`(OrderID,UserID,Status,CreatedDate) values"
                + " ("
                + mxOrdId + ","
                + "1,"
                + "'Processing',"
                + "'" + strDate + "'"
                + ")";
        stmt1.executeUpdate(q1);
        System.out.println(q1);

        Statement stmt2 = con.createStatement();
        String q2 = "insert into cart(TotalPrice,OrderID) values"
                + " ("
                + request.getParameter("total") + ","
                + mxOrdId
                + ")";
        stmt2.executeUpdate(q2);


        for(int i=1; i<= (int)session.getAttribute("cntCart"); i++) {
            Statement stmt = con.createStatement();
            stmt.executeUpdate("update GreenMart.Products set Quantity=Quantity-"+request.getParameter("qty"+String.valueOf(i))
                    +" where ProductID="+request.getParameter("pid"+String.valueOf(i)));
            session.setAttribute(request.getParameter("pid"+String.valueOf(i)), null);
            stmt.close();

            Statement stmt3 = con.createStatement();
            String q3 = "insert into cartdetails(ProductID,Quantity) values"
                    + " ("
                    + request.getParameter("pid"+String.valueOf(i)) + ","
                    + request.getParameter("qty"+String.valueOf(i))
                    + ")";
            stmt3.executeUpdate(q3);
            stmt3.close();
        }



        con.close();
//    } catch(SQLException e) {
//        System.out.println("SQLException caught: " + e.getMessage());
//    }
%>

<h2>Thank you for shopping</h2>>


</body>
</html>
