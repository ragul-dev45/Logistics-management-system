<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Your Shipment Reports</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto;background-color: #f2f2f2;  }
        th, td { border: 1px solid #333; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        h2 { text-align: center; margin-top: 20px; }
        body{
        background: #cfc25f;
        }
        
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
    <h2>Your Shipment Reports</h2>
    <table>
        <thead>
            <tr>
                <th>Origin</th>
                <th>Destination</th>
                <th>Status</th>
                <th>Estimated Date</th>
                <th>Amount Paid</th>
                <th>Pending Amount</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="report" items="${reports}">
                <tr>
                    <td>${report.origin}</td>
                    <td>${report.destination}</td>
                    <td>${report.status}</td>
                    <td>${report.estimatedDate}</td>
                    <td>${report.amountPaid}</td>
                    <td>${report.pendingAmount}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty reports}">
                <tr>
                    <td colspan="6">No reports found for your account.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    <a href="/dashboard" class=back-btn>Back</a>
</body>
</html>
