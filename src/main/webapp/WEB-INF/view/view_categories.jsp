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
        $('#view_categories').dataTable();
    });
    </script>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item mt-3 ml-3">
                <form action="/view_users" method="get">
                    <input class="btn btn-primary mt-3 ml-3 mb-1" type="submit" value="Back"/>
                </form>
            </li>
            <li class="nav-item mt-3 ml-3">
                <form action="/add_category" method="post" modelAttribute="category">
                    <input type="text" class="ml-3 mt-4 mb-1" name="categoryName"/>
                    <input class="btn btn-primary ml-3 mb-1" type="submit" value="Add category"/>
                </form>
            </li>
            <li class="nav-item mt-3 ml-3">
                <form action="/delete_categories" method="post" id="checkbox_form">
                    <input class="btn btn-primary mt-3 ml-3 mb-1" type="submit" value="Delete"/>
                </form>
            </li>
        </ul>
    </nav>
    <table class="table table-striped" id="view_categories">
        <thead>
        <tr>
            <th>Category</th>
            <th>Num of activities</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="end" scope="page" value="${categories.size()-1}"/>
        <c:forEach varStatus="position" begin="0" end="${end}">
            <tr>
                <td>
                    <c:out value="${categories[position.current][0]}"/>
                </td>
                <td><c:out
                        value="${categories[position.current][1]}"/>
                </td>
                <td><input type="checkbox" name="categories"
                           value="${categories[position.current][2]}" form="checkbox_form">
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
