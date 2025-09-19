<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>My Shipments</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif;
          background-image: url("images/adminshipment.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 50% 55%;
         margin: 20px; 
         color: #333;
          }
        h2 { text-align: center; color: white; margin-bottom: 25px; font-size: 40px; }
        table { border-collapse: collapse; width: 90%; margin: 0 auto; background-color: #fff; box-shadow: 0 2px 8px rgba(0,0,0,0.1);}
        th, td { border: 1px solid #ddd; padding: 12px 15px; text-align: center; }
        th { background-color: #2c3e50; color: #fff; text-transform: uppercase; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        .status { padding: 4px 8px; border-radius: 5px; color: #fff; font-weight: bold; }
        .PENDING { background-color: #f39c12; }       /* orange */
        .IN_TRANSIT { background-color: #2980b9; }    /* blue */
        .DELIVERED { background-color: #27ae60; }     /* green */
        .logout-btn { 
        background: #e60000; 
        color: white; 
        border: none; 
        float:right; 
        padding: 8px 15px; 
        border-radius: 5px;
        margin-top: 20px;
        margin-right: 75px; 
        cursor: pointer; 
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
<h2>MY SHIPMENTS</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Origin</th>
        <th>Destination</th>
        <th>Status</th>
        <th>Estimated Date</th>
    </tr>
    <c:forEach var="shipment" items="${shipments}">
        <tr>
            <td>${shipment.id}</td>
            <td>${shipment.name}</td>
            <td>${shipment.origin}</td>
            <td>${shipment.destination}</td>
            <td>
                <span class="status ${shipment.status}">
                    ${shipment.status}
                </span>
            </td>
            <td>${shipment.estimatedDate}</td>
        </tr>
    </c:forEach>
</table>

        <a href="/dashboard" class=back-btn>Back</a>
 
</body>
</html>
