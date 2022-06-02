<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Join Us</title>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
    <link href="css/style1.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<header>
    <ul style="float:right; margin-right:55px; overflow:hidden">
        <li style="list-style:none; display:inline-block; margin-right:5px">
            <a href="/login?lang=uk_UA" class="ua"><img
                    src="https://www.countryflags.io/ua/flat/32.png"></a>
        </li>
        <li style="list-style:none; display:inline-block">
            <a href="/login?lang=en_US" class="us"><img
                    src="https://www.countryflags.io/us/flat/32.png"></a>
        </li>
    </ul>
</header>
<div class="container">
    <div class="box">
        <img class="avatar" src="images/user-avatar.png">
        <h1>Login</h1>
        <form action="/login" method="post">
            <p>Username</p>
            <input type="text" placeholder="Username" name="userName" required>
            <p>Password</p>
            <input type="password" placeholder="Password" name="password" required>
            <input type="submit" value="Login">
            <a href="/register">Create new account</a>
        </form>
    </div>
</div>
</body>
</html>