<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shipment List</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            padding: 40px;
            background-image: url("images/adminshipment.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 50% 55%;   
        }
.back-btn {
   background-color: #3498db;
            color: #fff;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            margin-bottom: 5px;
            float: right;
            margin-right: 5px;
            transition: all 0.3s ease;
            font-family: 'Poppins', sans-serif;
            font-weight: 600; 
            font-size: 14px;  
            letter-spacing: 0.5px;
            margin-top: 25px;
}

.back-btn:hover {
    background: #5a6268;
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
            float: left;
            margin-bottom: 20px;
            margin-top:20px;
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
    <button type="button" class="back-btn" onclick="history.back()">Back</button>
    <a href="${pageContext.request.contextPath}/shipments/new" class="btn btn-add">+ Add New Shipment</a>

    <table>
        <thead>
        <tr>
            <th>ID</th>
			<th>Name</th>
            <th>Origin</th>
            <th>Destination</th>
            <th>Status</th>
            <th>Estimated Date</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="shipment" items="${shipments}">
            <tr>
                <td>${shipment.id}</td>
				<td>${shipment.name}</td>
                <td>${shipment.origin}</td>
                <td>${shipment.destination}</td>
                <td>${shipment.status}</td>
                <td>${shipment.estimatedDate}</td>
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