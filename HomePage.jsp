<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>Home Page</title>
    <meta charset="UTF-8">
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
            <li class="nav-link"><a href="HomePage.jsp">Categories</a></li>
            <li class="nav-link"><a href="Signout.jsp">Sign Out</a></li>
            <li class="nav-link"><a href="Cart.jsp">Shopping Cart</a></li>
        </ul>
    </nav>
    <!-----------------------------MENU BAR (END)---------------------------------------------->

</header>

<body>
<table border="1">
        <%
                String db = "vu";
                String user; // assumes database name is the same as username
                user = "root";
                String password = "password";
                try {

                    java.sql.Connection con;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenMart?autoReconnect=true&useSSL=false",user, password);
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM GreenMart.Category;");
                    while (rs.next()) {
                        int ID = rs.getInt("CategoryID");
                        String Name = rs.getString("CName");
                        String Photo = rs.getString("DescripPhoto");
                        String Add = rs.getString("CatAdd");
                        %>
    <div>
        <a href=<%=Add%> class="categories"> <img src = <%=Photo%>> <h3><%=Name%></h3></a>
    </div>
        <%
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                } catch(SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
                }
            %>

</body>
</html>
