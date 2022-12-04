
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<!DOCTYPE html>

<html>
<head>
    <title>Dairy</title>
    <meta charset="UTF-8">
    <jsp:include page="/shared/style_import.jsp" />
</head>
<body>
<!-----------------------------MENU BAR (START)------------------------------------------->
<header>
    <jsp:include page="../header.jsp" />
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
        String user; // assumes database name is the same as username
        user = "root";
        String password = "root";

        if(request.getParameter("addToCart")!=null) {
            session.setAttribute(request.getParameter("addToCart"), true);
        }


        java.sql.Connection con;
        Class.forName("com.mysql.cj.jdbc.Driver");
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
