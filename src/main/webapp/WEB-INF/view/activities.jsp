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
        $('#activities').dataTable();
    });
    </script>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li>
                    <form action="/create_activity" method="get">
                        <button class="btn btn-light mt-3 ml-3" type="submit">Add activity</button>
                    </form>
                </li>
                <li>
                    <form action="/view_timelogs" method="get">
                        <button class="btn btn-light mt-3 ml-3" type="submit">View timelogs</button>
                    </form>
                </li>
                <li>
                    <form action="/logout" method="post">
                        <button class="btn btn-primary mt-3 ml-3" type="submit">Log out</button>
                    </form>
                </li>
                <li class="nav-item mt-3 ml-3">
                    <input class="btn btn-primary" type="submit" form="checkbox_form"
                           value="Delete"/>
                </li>
                <li class="nav-item mt-3 ml-3">
                    <input class="form-control" type="date" placeholder="Date"
                           name="startDate" form="search_form"
                           value="Start date"/>
                </li>
                <li class="nav-item mt-3 ml-3">
                    <input class="form-control" type="date" placeholder="Date"
                           name="endDate" form="search_form"
                           value="End date"/>
                </li>
                <form action="/get_by_date" method="get" id="search_form">
                    <button class="btn btn-light mt-3 ml-3" type="submit">Search</button>
                </form>
            </ul>
        </div>
    </nav>
    <table class="table table-striped" id="activities">
        <thead>
        <tr>
            <th>Activity</th>
            <th>Category</th>
            <th>Duration</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${activities.size() > 0}">
                <c:set var="end" scope="page" value="${activities.size()-1}"/>
            </c:when>
            <c:otherwise>
                <c:set var="end" scope="page" value="${activities.size()}"/>
            </c:otherwise>
        </c:choose>
        <c:forEach varStatus="position" begin="0" end="${end}">
            <tr>
                <td>
                    <form method="get" action="create_timelog">
                        <input type="submit" class="btn btn-light"
                               value="${activities[position.current][1]}"/>
                        <input type="hidden" value="${activities[position.current][0]}" name="id"/>
                    </form>
                </td>
                <td><c:out value="${activities[position.current][2]}"/></td>
                <td><c:out value="${timelogs[position.current]}"/></td>
                <td><input type="checkbox" name="activities"
                           value="${activities[position.current][0]}" form="checkbox_form"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <form method="post" action="delete_activities" id="checkbox_form">
    </form>
</div>
</body>
</html>
