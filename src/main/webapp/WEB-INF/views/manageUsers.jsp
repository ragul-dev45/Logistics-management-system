<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Manage Users</title>
    <style>
        /* Body styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
         background: #cfc25f;
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 50% 55%;
            color: #333;
            margin: 20px;
        }

        /* Heading */
        h2 {
            text-align: center;
            font-size:40px;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        /* Add button */
        a.add-user-btn {
            display: inline-block;
            background-color: #3498db;
            color: #fff;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            margin-bottom: 15px;
            float: right;
            margin-right: 65px;
            transition: all 0.3s ease;
            font-family: 'Poppins', sans-serif;
            font-weight: 600; 
            font-size: 14px;  
            letter-spacing: 0.5px;
        }

        a.add-user-btn:hover {
            background-color: #2980b9;   
            transform: scale(1.05);      
            box-shadow: 0 4px 12px rgba(0,0,0,0.2); 
            color: #dee3df;
        }

        /* Table styling */
        table {
            border-collapse: collapse;
            width: 90%;
            margin: 0 auto;
            background-color: #ffffff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #2c3e50;
            color: #ffffff;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Action links */
        a.action-link {
            color: #3498db;
            text-decoration: none;
            margin: 0 5px;
            position: relative;
            transition: color 0.3s ease;
            font-family: 'Poppins', sans-serif;
            font-weight: 600;   /* bold */
            font-size: 14px;    /* adjust as needed */
            letter-spacing: 0.5px; /* smooth effect */
        }

        a.action-link::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: -2px;
            width: 0;
            height: 2px;
            background: #e74c3c;
            transition: width 0.3s ease;
        }

        a.action-link:hover {
            color: #e74c3c;
        }

        a.action-link:hover::after {
            width: 100%; 
        }
    .back-btn {
    display: inline-block;
            background-color: #3498db;
            color: #fff;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            margin-bottom: 15px;
            float: right;
            margin-right: 75px;
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

        
    </style>
</head>
<body>
<h2>Manage Users</h2>

<a href="${pageContext.request.contextPath}/users/add" class="add-user-btn">Add New User</a>

<table>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Email</th>
        <th>Role</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.role}</td>
            <td>
                <a href="${pageContext.request.contextPath}/users/edit/${user.id}" class="action-link">Edit</a> |
                <a href="${pageContext.request.contextPath}/users/delete/${user.id}" onclick="return confirm('Are you sure?');" class="action-link">Delete</a>
                       
                
            </td>
        </tr>
    </c:forEach>
</table>
 <button type="button" class="back-btn" onclick="history.back()">Back</button>
</body>

</html>
