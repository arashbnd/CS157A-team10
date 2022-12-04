<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In</title>
    <jsp:include page="/shared/style_import.jsp" />
</head>

<body>

<header>
    <jsp:include page="../header.jsp" />
</header>
<div class="login">
    <form action="<%=request.getContextPath()%>/login" method="post">
        <h1>Log in to your account</h1>
        <p style="color: red;">${errorString}</p>
        <fieldset>
            <legend>
                <h3>Account Details</h3>
            </legend>
            <div class="account__details">

                <div><label>Username*</label><input type="text"name="user_name" value="${login.username}" required></div>
                <div><label>Password*</label><input type="password" name="user_password" value="${login.password}" required></div>

            </div>
        </fieldset>
        <fieldset>
            <div class="terms">
                <div class="checkbox">
                    <input type="checkbox" name="rememberMe" value ="Y"/> Remember me
                </div>
        </fieldset>
        <button class="signin" type="submit" href="/">Submit</button>
    </form>
</div>

<jsp:include page="/shared/scripts_import.jsp" />

</body>

</html>