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
<div class="container">
    <form action="activities" method="get">
        <button class="btn btn-light mt-3 ml-3" type="submit">Back</button>
    </form>
    <form action="/add_activity" method="post" modelAttribute="activity">
        <div class="form-group">
            <label for="activity_name" class="col-2 col-form-label">Activity</label>
            <div class="col-5">
                <input class="form-control" type="text" placeholder="Activity"
                       name="activityName" id="activity_name"
                       required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-2 col-form-label">Category</label>
            <div class="col-5">
                <select class="form-select" name="category" aria-label="Default select example">
                    <option selected>Category</option>
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.getId()}">${category.getCategoryName()}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <div class="offset-sm-4">
                <button type="submit" class="btn-md btn-primary">Add activity</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
