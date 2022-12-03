
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
            <li class="nav-link"><a href="categories.html">Categories</a></li>
            <li class="nav-link"><a href="Signout.html">Sign Out</a></li>
            <li class="nav-link"><a href="Cart.html">Shopping Cart</a></li>
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
    try {



        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenMart?autoReconnect=true&useSSL=false",user, password);



        for(int i=1;i<=Integer.valueOf(session.getAttribute("cntCart").toString());i++) {
            Statement stmt = con.createStatement();
            stmt.executeUpdate("update GreenMart.Products set Quantity=Quantity-"+request.getParameter("qty"+String.valueOf(i))
                    +" where ProductID="+request.getParameter("pid"+String.valueOf(i)));
            session.setAttribute(request.getParameter("pid"+String.valueOf(i)), null);
            stmt.close();
        }



        con.close();
    } catch(SQLException e) {
        System.out.println("SQLException caught: " + e.getMessage());
    }
%>

<section>
    <a>
        <div style="padding-left:200px; padding-right:200px; padding-top:50px; padding-bottom:100px;">
            <h2>Order succesful, thank you for your order!</h2>
            <br>
            <b style="font-size:100%; "> Estimated Arrival:</b>
            <br>
            <br>
            <p style="text-indent: 20px; ">2-5 Business Days</p>
            <br>
            <br>
            <br>
            <p> Got any questions about your order, feel free to contact us! </p>
            <br>
            <b style="font-size:100%; "> CALL US AT </b>
            <br>
            <br>
            <p style="text-indent: 20px; ">(888)888-8888  </p>
            <br>
            <b style="font-size:100%;"> EMAIL US AT  </b>
            <br>
            <br>
            <p style="text-indent: 20px; "> questions@ofs-sj.com  </p>
            <br>
            <br>
            <p style="text-align:center; font-size:120%; "> Thank you for shopping with OFS, see you next time!  </p>

            <form method="get" action="StartHere.php">
                <button type="submit">Log Out</button>
            </form>

        </div>
    </a>
</section>

</body>
</html>
