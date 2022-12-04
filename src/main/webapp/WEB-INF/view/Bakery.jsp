<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<!DOCTYPE html>
    <jsp:include page="/shared/style_import.jsp" />
<html>
    <head>
        <meta charset="UTF-8">
        <title>Bakery</title>
    </head>

<body>

<header>
    <jsp:include page="../header.jsp" />
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
        java.sql.Connection con;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenMart?autoReconnect=true&useSSL=false","root", "root");

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
		Quantity:  <input type="text" name="Quantity"/>
		<input type="submit" name="quantity" value="Add">
		</form></td>
		
		
    </tr>
    <%
    
	//through result set, get the product id and quantity number
	String id = rs.getString("ProductID");
	String qnt = request.getParameter("Quantity"); // this is request because the value is coming from a button not db
	out.println("ProductId: " + id + " Quanitity: " + qnt);
	
    }
    %>
    </tbody>
    </table>
</body>
</html>