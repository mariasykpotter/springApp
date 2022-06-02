<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <meta name="description" content="Bootstrap">
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body>
<div class="container">
    <form action="/view_timelogs" method="get">
        <button class="btn btn-light mt-3 ml-3" type="submit">Back</button>
    </form>
    <form action="/edit_timelog" method="post">
        <div class="form-group">
            <label class="col-2 col-form-label">Activity</label>
            <select class="form-select" name="activity">
                aria-label="Default select example">
                <option value="${timeLogactivities[0]}"
                        selected>${timeLogactivities[1]}</option>
                <c:forEach items="${activities}" var="activity">
                    <c:if test="${!timeLogactivities[1].equals(activity[1])}">
                        <option value="${activity[0]}">${activity[1]}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label class="col-2 col-form-label">Start time</label>
            <input type="time" name="start_at"
                   value="${timeLogactivities[3]}" step="1"/>
        </div>
        <div class="form-group">
            <label class="col-2 col-form-label">End time</label>
            <input type="time" name="end_at"
                   value="${timeLogactivities[4]}" step="1"/>
        </div>
        <div class="form-group">
            <label class="col-2 col-form-label">Date</label>
            <input type="date" name="date"
                   value="${timeLogactivities[6]}"/>

        </div>
        <div class="form-group">
            <label class="col-2 col-form-label">Task name</label>
            <c:choose>
                <c:when test="${timeLogactivities[7]!=null}">
                    <input type="text" name="task" value="${timeLogactivities[7]}"/>
                </c:when>
                <c:otherwise>
                    <input type="text" name="task"/>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="form-group row">
            <div class="offset-sm-3">
                <button type="submit" class="btn-md btn-primary">Edit timelog</button>
            </div>
        </div>
        <input type="hidden" name="time_log"
               value="${timeLogactivities[8]}"/>
    </form>
</div>
</body>
</html>
