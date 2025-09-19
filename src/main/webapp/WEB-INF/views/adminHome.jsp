<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
    body{
    background: #00FFEF;
    }
    .logout a {
            display: inline-block;
            background-color: #3498db;
            color: #fff;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            margin-bottom: 15px;
            float: right;
            margin-right: 125px;
            transition: all 0.3s ease;
            font-family: 'Poppins', sans-serif;
            font-weight: 600; 
            font-size: 14px;  
            letter-spacing: 0.5px;
            margin-top: 20px;
            margin-left: 80px;
        }
        .logout a:hover {
 
            background: #a71d2a;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Admin Dashboard</h2>
<header>
   
</header>
    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            <h4>Total Shipments: ${totalShipments}</h4>
        </div>
        <div class="card-body">
            <h5>Shipments by Status:</h5>
            <ul class="list-group">
                <c:forEach var="entry" items="${shipmentStatusCounts}">
                    <li class="list-group-item d-flex justify-content-between">
                        <span>${entry.key}</span>
                        <span>${entry.value}</span>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="row">
        <!-- Shipment Management -->
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-header bg-info text-white">Shipment Management</div>
                <div class="card-body">
                    <a href="${pageContext.request.contextPath}/shipmentList" class="btn btn-info">Manage Shipments</a>
                </div>
            </div>
        </div>

        <!-- Report Section -->
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-header bg-success text-white">Reports</div>
                <div class="card-body">
                    <a href="/reports" class="btn btn-success">Generate Reports</a>
                </div>
            </div>
        </div>

        <!-- User Management -->
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-header bg-warning text-dark">User Management</div>
                <div class="card-body">
                    <a href="/users" class="btn btn-warning">Manage Users</a>
                </div>
            </div>
        </div>
    </div>
</div>
 <div class="logout">
        <a href="login">Logout</a>
    </div>
</body>
</html>
