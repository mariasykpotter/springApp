<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<header>
    <ul style="float:right; margin-right:55px; overflow:hidden">
        <li style="list-style:none; display:inline-block; margin-right:5px">
            <a href="/write?lang=uk_UA" class="ua"><img
                    src="https://www.countryflags.io/ua/flat/32.png"></a>
        </li>
        <li style="list-style:none; display:inline-block">
            <a href="/write?lang=en_US" class="us"><img
                    src="https://www.countryflags.io/us/flat/32.png"></a>
        </li>
    </ul>
</header>
<c:if test="${message !=null}">
    <div class="alert alert-info alert-dismissible fade show">
        <strong>Info! </strong>${message}
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
</c:if>
<div class="container">
    <div class="form-group">
        <label class="col-2 col-form-label">Activity</label>
        <div class="col-5">
            <input class="form-control" type="text" placeholder="Activity"
                   name="activity" id="name"
                   value="${activity.getActivityName()}" required/>
        </div>
    </div>
    <form action="/add_timelog" method="post">
        <input type="hidden" name="activity" value="${activity}">
        <div class="form-group">
            <label for="start" class="col-2 col-form-label">Start time</label>
            <div class="col-5">
                <input class="form-control" type="time" placeholder="Start time"
                       name="startAt" id="start" step="1">
            </div>
        </div>
        <div class="form-group">
            <label for="example-time-input" class="col-2 col-form-label">End time</label>
            <div class="col-5">
                <input class="form-control" type="time" placeholder="End time"
                       name="endAt"
                       id="example-time-input" step="1">
            </div>
        </div>
        <div class="form-group">
            <label for="example-time-input" class="col-2 col-form-label">Date</label>
            <div class="col-5">
                <input class="form-control" type="date" placeholder="Date"
                       name="date" step="1">
            </div>
        </div>
        <div class="form-group">
            <label for="example-time-input" class="col-2 col-form-label">Task name</label>
            <div class="col-5">
                <input class="form-control" type="text" placeholder="Task name"
                       name="task" step="1">
            </div>
        </div>
        <div class="form-group row">
            <div class="offset-sm-4">
                <button type="submit" class="btn-md btn-primary">Add timelog</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
