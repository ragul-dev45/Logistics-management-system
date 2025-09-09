<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shipment List</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
            padding: 40px;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 14px 16px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 4px;
            color: white;
            font-size: 14px;
        }

        .btn-add {
            background-color: #28a745;
            float: right;
            margin-bottom: 20px;
        }

        .btn-edit {
            background-color: #ffc107;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn:hover {
            opacity: 0.85;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Shipment List</h2>

    <a href="${pageContext.request.contextPath}/shipments/new" class="btn btn-add">+ Add New Shipment</a>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Origin</th>
            <th>Destination</th>
            <th>Status</th>
            <th>Inserted At</th>
            <th>Updated At</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="shipment" items="${shipments}">
            <tr>
                <td>${shipment.id}</td>
                <td>${shipment.origin}</td>
                <td>${shipment.destination}</td>
                <td>${shipment.status}</td>
                <td>${shipment.insertedAt}</td>
                <td>${shipment.updatedAt}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/shipments/edit/${shipment.id}" class="btn btn-edit">Edit</a>
                    <a href="${pageContext.request.contextPath}/shipments/delete/${shipment.id}" class="btn btn-delete"
                       onclick="return confirm('Are you sure you want to delete this shipment?');">
                        Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
