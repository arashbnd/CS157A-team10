<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <jsp:include page="/shared/style_import.jsp" />
</head>
<body>
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
        <li class="nav-link"><a href="home">Categories</a></li>
        <li class="nav-link"><a href="cart">Shopping Cart</a></li>
    </ul>
</nav>
<!-----------------------------MENU BAR (END)---------------------------------------------->

</body>
</html>