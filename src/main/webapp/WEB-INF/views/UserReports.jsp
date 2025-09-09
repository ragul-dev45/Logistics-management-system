<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Reports</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body style="background-color:#f8f9fa;">

<div class="container mt-5">
    <h2 class="text-center mb-4">My Reports</h2>

    <table class="table table-bordered table-striped shadow">
        <thead class="table-dark">
            <tr>
                <th>Total Paid</th>
                <th>Pending</th>
                <th>Due Date</th>
                <th>Delivered</th>
                <th>In Progress</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="report" items="${reports}">
            <tr>
                <td>${report.totalPaid}</td>
                <td>${report.pending}</td>
                <td>${report.dueDate}</td>
                <td>${report.delivered}</td>
                <td>${report.inProgress}</td>
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
