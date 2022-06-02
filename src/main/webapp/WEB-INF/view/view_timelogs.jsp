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
        $('#time_logs').dataTable();
    });
    </script>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <c:choose>
            <c:when test="${userType.equals(\"user\")}">
                <form action="activities" method="get">
                    <button class="btn btn-light mt-3 ml-3" type="submit">Back</button>
                </form>
            </c:when>
            <c:otherwise>
                <form action="view_users" method="get">
                    <button class="btn btn-light mt-3 ml-3" type="submit">Back</button>
                </form>
            </c:otherwise>
        </c:choose>
    </nav>
    <table class="table table-striped" id="time_logs">
        <thead>
        <tr>
            <th>Activity</th>
            <th>Category</th>
            <th>Start time</th>
            <th>End time</th>
            <th>Duration</th>
            <th>Date</th>
            <th>Task</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${timeLogactivities.size()>0}">
                <c:set var="end" scope="page" value="${timeLogactivities.size()-1}"/>
            </c:when>
            <c:otherwise>
                <c:set var="end" scope="page" value="${timeLogactivities.size()}"/>
            </c:otherwise>
        </c:choose>
        <c:forEach varStatus="position" begin="0" end="${end}">
            <tr>
                <td>
                    <c:choose>
                        <c:when test="${userType.equals('user')}">
                            <form method="get" action="view_edit">
                                <input type="submit" class="btn btn-light"
                                       value="${timeLogactivities[position.current][1]}"/>
                                <input type="hidden" value="${timelogs[position.current].getId()}" name="id"/>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <c:out value="${timeLogactivities[position.current][1]}"/>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:out value="${timeLogactivities[position.current][2]}"/></td>
                <td><c:out
                        value="${timeLogactivities[position.current][3]}"/></td>
                <td><c:out
                        value="${timeLogactivities[position.current][4]}"/>
                </td>
                <td><c:out value="${timeLogactivities[position.current][5]}"/></td>
                <td><c:out
                        value="${timeLogactivities[position.current][6]}"/>
                </td>
                <td><c:out
                        value="${timeLogactivities[position.current][7]}"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
