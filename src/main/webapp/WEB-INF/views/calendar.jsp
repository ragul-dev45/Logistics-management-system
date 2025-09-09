<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Calendar</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body style="background-color:#f8f9fa;">

<div class="container mt-5">
    <h2 class="text-center mb-4">My Calendar for ${username}</h2>

    <table class="table table-bordered table-striped shadow">
        <thead class="table-dark">
            <tr>
                <th>Title</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="event" items="${events}">
            <tr>
                <td>${event.title}</td>
                <td>${event.date}</td>
                <td>${event.status}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-primary">Back to Dashboard</a>
    </div>
</div>

</body>
</html>
