<%@ page import="java.sql.*"%>
<html>

<head>
    <title>Home Page</title>
    <link rel="stylesheet" href="styles.css">
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
            <li class="nav-link"><a href="categories.html">Categories</a></li>
            <li class="nav-link"><a href="Signout.html">Sign Out</a></li>
            <li class="nav-link"><a href="Cart.html">Shopping Cart</a></li>
        </ul>
    </nav>
<!-----------------------------MENU BAR (END)---------------------------------------------->

</header>

<div class="main-text">
    <h1>Categories</h1>
</div>
<div class = "row">

</div>
<div class="row">
    <div class = "column">
        <a href="cat_beverages.jsp" class="categories"><img src="Categories-Picture/beverages.jpg"><h3>Beverages</h3></a>
    </div>
    <div class="column">
        <a href="Dairy.jsp" class="categories"><img src="Categories-Picture/daily.jpg"><h3>Dairy</h3></a>
    </div>
    <div class="column">
        <a href="cat_meat.jsp" class="categories"><img src="Categories-Picture/deli.jpg"><h3>Meat</h3></a>
    </div>
</div>

<div class="row">
    <div class = "column">
        <a href="cat_fruits.php" class="categories"><img src="Categories-Picture/fruit.jpg"><h3>Fruit</h3></a>
    </div>
    <div class="column">
        <a href="cat_snacks.php" class="categoriesm"><img src="Categories-Picture/snacks.jpg"><h3>Snacks</h3></a>
    </div>
    <div class="column">
        <a href="cat_vegetables.php" class="categories"><img src="Categories-Picture/vegetables.jpg"><h3>Vegetables</h3></a>
    </div>
</div>
<div class="row">
    <div class = "column">
        <a href="cat_bakery.jsp" class="categories"><img src="Categories-Picture/bakery.jpg"><h3>Bakery</h3></a>
    </div>
    <div class="column">
        <a href="cat_frozen.jso" class="categories"><img src="Categories-Picture/frozen.jpg"><h3>Frozen</h3></a>
    </div>
    <div class="column">
        <a href="cat_condiments.jsp" class="categories"><img src="Categories-Picture/condiments-and-sauces.jpg"><h3>Condiments And Sauces</h3></a>
    </div>
</div>
<div class="row">
    <div class = "column">
        <a href="cat_drygoods.jsp" class="categories"><img src="Categories-Picture/dry-good-and-pasta.jpg"><h3>Dry Goods And Pasta</h3></a>
    </div>
</div>
</div>


<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <td>SJSU_ID</td>--%>
<%--        <td>Name</td>--%>
<%--        <td>Major</td>--%>
<%--    </tr>--%>
<%--        <%--%>
<%--                String db = "GreenMart";--%>
<%--                String user; // assumes database name is the same as username--%>
<%--                user = "root";--%>
<%--                String password = "password";--%>
<%--                try {--%>
<%--                    java.sql.Connection con;--%>
<%--                    Class.forName("com.mysql.jdbc.Driver");--%>
<%--                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vu?autoReconnect=true&useSSL=false",user, password);--%>
<%--                    out.println(db + " database successfully opened.<br/><br/>");--%>

<%--                    out.println("Initial entries in table \"HW1\": <br/>");--%>
<%--                    Statement stmt = con.createStatement();--%>
<%--                    ResultSet rs = stmt.executeQuery("SELECT * FROM GreenMart.User;");--%>
<%--                    out.println("Query is executed");--%>
<%--                    while (rs.next()) {--%>
<%--                        out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) + "<br/><br/>");--%>
<%--                    }--%>
<%--                    rs.close();--%>
<%--                    stmt.close();--%>
<%--                    con.close();--%>
<%--                } catch(SQLException e) {--%>
<%--                out.println("SQLException caught: " + e.getMessage());--%>
<%--                }--%>
<%--        %>--%>
</body>

</html>
