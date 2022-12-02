<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>

    <jsp:include page="/shared/style_import.jsp" />
</head>

<body>

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
<div class="signup">
    <div class="alert alert-success center" role="alert">
        <p>${NOTIFICATION}</p>
    </div>
    <form action="<%=request.getContextPath()%>/register" method="post">

        <h1>Create a free account</h1>
        <fieldset>
            <legend>
                <h3>Account Details</h3>
            </legend>
            <div class="account__details">
                <div><label>Email*</label><input type="text" class="form-control" id="email"  name="email" required></div>
                <div><label>Username*</label><input type="text" class="form-control" id="username"  name="username" required></div>
                <div>
                    <label>Password*</label><input type="password"
                                                               class="form-control" id="password" placeholder="Password"
                                                               name="password" required>
                </div>
                <div>
                    <label>Repeat password*</label><input type="password"
                                                                      class="form-control" id="repassword" placeholder="Password"
                                                                      name="password" required>
                </div>
            </div>
        </fieldset>
        <fieldset>
            <legend>
                <h3>Personal Details</h3>
            </legend>
            <div class="personal__details">
                <div>
                    <div><label>First Name*</label><input type="text" id="firstname"  name="firstname" required></div>
                    <div><label>Last Name*</label><input type="text" type="text" id="lastname"  name="lastname" required></div>
                    <div><label>Address</label><input type="text" type="text" id="addres"  name="address"></div>
                    <div><label>Phone Number</label><input type="text"type="text" id="phone"  name="phone" required></div>
                </div>
            </div>
        </fieldset>

        <button type="submit">Submit</button>
    </form>
</div>

<jsp:include page="/shared/scripts_import.jsp" />
</body>

</html>