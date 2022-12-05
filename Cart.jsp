<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.math.BigDecimal" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <title>Shopping Cart</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="rating" content="General">
    <meta name="expires" content="never">
    <meta name="language" content="English, EN">
    <meta name="description" content="Shopping cart project with HTML5 and JavaScript">
    <meta name="keywords" content="HTML5,CSS,JavaScript, html5 session storage, html5 local storage">
<%--    <meta name="author" content="dcwebmakers.com">--%>
    <script src="Storage.js"></script>
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
<div id="w">
    <header id="title">
        <h1>Shopping Cart</h1>
    </header>
</div>
<div class="page">
    <table class="cart">
        <thead>
        <tr>
            <th class="two">Product</th>
            <th class="five">Photo</th>
            <th class="six">Quantity</th>
            <th class="six">Price/ea</th>
            <th class="five">Sub Total</th>
            <th class="six" action = "remove">Remove</th>
        </tr>
        </thead>
        <form method="get" action="Confirmation.jsp">
            <%
                String db = "vu";
                String user; // assumes database name is the same as username
                user = "root";
                String password = "password";
                double tot=0;
                try {

                    if(request.getParameter("delete")!=null) {
                        session.setAttribute(request.getParameter("delete"), null);
                    }


                    java.sql.Connection con;
                    Class.forName("com.mysql.jdbc.Driver");
                   // con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GreenMart?autoReconnect=true&useSSL=false",user, password);
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/BAHRAMIANDEHKORDI?autoReconnect=true&useSSL=false","root", "root");
                  Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM Products;");

                    int i=0;


                    while (rs.next()) {
                        int ProductID = rs.getInt("ProductID");
                        int CatID = rs.getInt("CategoryID");
                        String PName = rs.getString("PName");
                        int Inventory = rs.getInt("Quantity");
                        BigDecimal PriceEach = rs.getBigDecimal("Price");
                        String Descrip = rs.getString("Description");
                        String Photo = rs.getString("Photo");
                        String Add = rs.getString("ItemPageAdd");



                        if(session.getAttribute(String.valueOf(ProductID))==null) {
                            continue;
                        }
                        i++;

                        tot+=rs.getBigDecimal("Price").doubleValue();
            %>
            <tr class="production">
                <td><%=PName%></td>
                <td><img src=<%=Photo%> class="product-img"></td>
                <td><input type="hidden" name="pid<%=String.valueOf(i)%>" value="<%=String.valueOf(ProductID)%>"/>
                    <input name="qty<%=String.valueOf(i)%>" id="qty<%=String.valueOf(i)%>" type="number" onchange="upd('price<%=String.valueOf(i)%>', '<%=PriceEach%>', 'qty<%=String.valueOf(i)%>')" value="1" min="0" max="99" class="qtyinput"></td>
                <td><%=PriceEach%></td>
                <td><input name="price<%=String.valueOf(i)%>" id="price<%=String.valueOf(i)%>" value="<%=PriceEach%>" readonly></td>
                <td><span class="remove"><img src ="./img/trash-button.png" class ="remove-icon" alt="X" onclick="location.href='Cart.jsp?delete=<%=String.valueOf(ProductID)%>'"></span></td>
            </tr>
            <%
                        //                    out.println(PName + Photo + 1 + PriceEach +  "<br/><br/>");
                    }
                    session.setAttribute("cntCart", i);
                    rs.close();
                    stmt.close();
                    con.close();
                } catch(SQLException e) {
                    out.println("SQLException caught: " + e.getMessage());
                }
            %>

            <tbody>
            <tr class="checkoutrow"><td colspan="6" class="checkout">Total: <input id="total" name="total" value="<%=tot%>" readonly/></td></tr>
            <!-- checkout btn -->
            <tr class="checkoutrow">
                <td colspan="6" class="checkout"><button type="submit" id="submitbtn">Place Order</button></td>
            </tr>
        </form>
        </tbody>
    </table>
</div>
<script>
    function upd(x, priceEach, q) {
        var oldp =document.getElementById(x).value;
        var newp = priceEach*document.getElementById(q).value;
        console.log(oldp);
        console.log(newp);
        document.getElementById('total').value=(parseFloat(document.getElementById('total').value)+newp-oldp).toFixed(2);
        document.getElementById(x).value = newp.toFixed(2);
    }
</script>
</body>
</html>
