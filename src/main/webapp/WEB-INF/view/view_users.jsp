<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
          rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
    <script type="text/javascript"
            src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript"
            src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script>$(document).ready(function () {
        $('#view_users').dataTable();
    });
    </script>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item mt-3 ml-3">
                <form action="/logout" method="post">
                    <button class="btn btn-primary mt-3 ml-3" type="submit">Log out</button>
                </form>
            </li>
            <li class="nav-item mt-3 ml-3">
                <form action="/view_categories" method="get">
                    <input class="btn btn-light mt-3 ml-3" type="submit" value="View categories"/>
                </form>
            </li>
        </ul>
    </nav>
    <table class="table table-striped" id="view_users">
        <thead>
        <tr>
            <th>First name</th>
            <th>Last name</th>
            <th>User name</th>
            <th>Records num</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="end" scope="page" value="${users.size()}"/>
        <c:forEach varStatus="position" begin="0" end="${end}">
            <tr>
                <td>
                    <form method="get" action="view_timelogs">
                        <input type="submit" class="btn btn-light"
                               value="${users[position.current][1]}"/>
                        <input type="hidden" value="${users[position.current][0]}" name="id"/>
                    </form>
                </td>
                <td>
                    <c:out value="${users[position.current][2]}"/></td>
                <td><c:out
                        value="${users[position.current][3]}"/></td>
                <td><c:out
                        value="${users[position.current][4]}"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
