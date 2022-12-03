<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
    
          
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <title>Bakery</title>
    </head>

<body>

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
</header>

<table border="1">
    <thead>
        <tr>
            <th> Product </th>
            <th> Discription </th>
            <th> Price$ </th>
            <th> Quanitity </th>
        </tr>
    </thead>
   
    <tbody>
    <%
    String db = "BAHRAMIANDEHKORDI";
    String user; // assumes database name is the same as username
    user = "root";
    String password = "root";
    

    java.sql.Connection con; 
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/BAHRAMIANDEHKORDI?autoReconnect=true&useSSL=false","root", "root");
    
    Statement stmt = con.createStatement();
   
 	
 
    
    ResultSet rs = stmt.executeQuery("Select * from products where CategoryID = 1");
    int image_counter = 0;
    while(rs.next()){
    image_counter++;
    %>
    <tr>
    
        <!--  <td><%=rs.getString("Pname")%></td> -->
        <td><img src="images/category_1_products/<%=image_counter%>.jpg"style="width:5%;height:5%; padding:1 %; border:1%;">
        <%=rs.getString("Pname")%></td>
        <td><%=rs.getString("Description")%></td>
        
        <td><%=rs.getString("Price")%></td>
   
        <td><form action="bakery.jsp">
		Quantity:  <input type="text" name="quantity"/>
		<input type="submit" name="quantity" value="Add">
		</form></td>
		
		
    </tr>
    <%
    
	//through result set, get the product id and quantity number
	String id = rs.getString("ProductID");
	String qnt = request.getParameter("quantity");
	out.println("ProductId: " + id + " quantity: " + qnt);
	
    }
    %>
    </tbody>
    </table>
</body>
</html>