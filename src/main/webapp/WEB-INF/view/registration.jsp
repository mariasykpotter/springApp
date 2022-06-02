<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register Account</title>
    <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
    <link href="../../css/style1.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="container">
    <div class="regbox box">
        <img class="avatar" src="../../images/collaboration.png">
        <h1>Register account</h1>
        <form action="/signup" method="post" modelAttribute="user">
            <p>Firstname</p>
            <input type="text" placeholder="First name" name="firstName" required>
            <p>Lastname</p>
            <input type="text" placeholder="Last name" name="lastName" required>
            <p>Username</p>
            <input type="text" placeholder="userName" name="userName" required>
            <p>Password</p>
            <input type="password" placeholder="password" name="password" required>
            <a href="/">Already have an account?</a>
            <input type="submit" value="Register">
        </form>
    </div>
</div>
</body>
</html>
