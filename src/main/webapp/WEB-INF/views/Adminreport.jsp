<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map, java.util.List" %>
<%@ page import="com.example.Logistics.Entity.Shipment" %>
<%@ page import="com.example.Logistics.DTO.ShipmentDTO" %>
<%@ page import="java.time.LocalDate, java.time.YearMonth" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    Map<String, Long> statusCounts = (Map<String, Long>) request.getAttribute("statusCounts");
    Boolean showDateForm = (Boolean) request.getAttribute("showDateForm");
    List<Shipment> shipments = (List<Shipment>) request.getAttribute("shipments");
    Map<String, Long> monthlySummary = (Map<String, Long>) request.getAttribute("monthlySummary");
    String monthlySummaryMonthString = (String) request.getAttribute("monthlySummaryMonth");
    String month = (String) request.getAttribute("month");
    LocalDate startDate = (LocalDate) request.getAttribute("startDate");
    LocalDate endDate = (LocalDate) request.getAttribute("endDate");
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
%>

<html>
<head>
    <title>Reports</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
           background: url('${pageContext.request.contextPath}/images/adminreport.jpg') no-repeat center center fixed;
            margin: 40px;
        }
        h2, h3, h4 {
            color: #333;
        }
        .main-layout-container {
            display: flex;
            gap: 40px;
            flex-wrap: wrap;
            align-items: flex-start;
        }
        .left-panel {
            flex: 0 0 250px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        .right-panel {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        button {
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .status-report { background-color: #007bff; }
        .status-report:hover { background-color: #0056b3; }
        .date-report { background-color: #28a745; }
        .date-report:hover { background-color: #1e7e34; }
        .monthly-report { background-color: #ffc107; color: #333; }
        .monthly-report:hover { background-color: #e0a800; }

        /* Report Form/Chart Styling */
        .report-section {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .report-section h3, .report-section h4 {
            margin-top: -10px;
        }
        .report-form input[type="date"], .report-form input[type="month"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .report-form button {
            background-color: #28a745;
        }
        
        /* Table and Chart containers */
        .report-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 40px;
            flex-wrap: wrap;
        }
        
        table {
            border-collapse: collapse;
            width: 100%;
            background-color: white;
            max-width: 400px;
        }
        th, td {
            padding: 8px 12px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        canvas {
            max-width: 600px;
            max-height: 400px;
        }
        
        .back-btn {
    		display: inline-block;
            background-color: #3498db;
            color: #fff;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            float: left;
            transition: all 0.3s ease;
            font-family: 'Poppins', sans-serif;
            font-weight: 600; 
            font-size: 14px;  
            letter-spacing: 0.5px;
            margin-top: 25px;
            margin-bottom: 15px;
            
		}
		.back-btn:hover {
   			background: #5a6268;
		}
    </style>
</head>
<body>

    <h2>Reports Dashboard</h2>
    
    <div class="main-layout-container">
        <div class="left-panel">
            <form action="${pageContext.request.contextPath}/reports/byStatus" method="get">
                <button class="status-report" type="submit">Shipment Report by Status</button>
            </form>

            <form action="${pageContext.request.contextPath}/reports/byDateRange" method="get">
                <button class="date-report" type="submit">Shipment Report by Date Range</button>
            </form>
            
            <hr/>

            <div class="report-section report-form">
                <h3>Monthly Report</h3>
                <form method="get" action="${pageContext.request.contextPath}/reports">
                    <label for="month">Select Month:</label>
                    <input type="month" id="month" name="month" required value="<%= month != null ? month : YearMonth.now().toString() %>" />
                    <button type="submit">Generate</button>
                </form>
            </div>
            <div >
                <form >
                    <button type="button" class="back-btn" onclick="history.back()">Back</button>
                </form>
            </div>
            
        </div>
        
        
        

        <div class="right-panel">
            
            <% if (monthlySummary != null) { %>
                <div class="report-section">
                    <h3>Monthly Shipment Report</h3>
                    <h4>Shipments for <%= monthlySummaryMonthString != null ? monthlySummaryMonthString : "" %></h4>
                    <% if (monthlySummary.isEmpty()) { %>
                        <p>No shipments found for this month.</p>
                    <% } else { %>
                        <canvas id="monthlyBarChart"></canvas>
                        <script>
                            const monthlyLabels = [
                                <% for (Map.Entry<String, Long> entry : monthlySummary.entrySet()) { %>
                                    "<%= entry.getKey() %>",
                                <% } %>
                            ];
                            const monthlyData = [
                                <% for (Map.Entry<String, Long> entry : monthlySummary.entrySet()) { %>
                                    <%= entry.getValue() %>,
                                <% } %>
                            ];
                            const ctxMonthly = document.getElementById('monthlyBarChart').getContext('2d');
                            new Chart(ctxMonthly, {
                                type: 'bar',
                                data: {
                                    labels: monthlyLabels,
                                    datasets: [{
                                        label: 'Number of Shipments',
                                        data: monthlyData,
                                        backgroundColor: 'rgba(75, 192, 192, 0.6)',
                                        borderColor: 'rgba(75, 192, 192, 1)',
                                        borderWidth: 1
                                    }]
                                },
                                options: {
                                    responsive: true,
                                    maintainAspectRatio: false,
                                    scales: {
                                        y: {
                                            beginAtZero: true,
                                            title: { display: true, text: 'Shipment Count' },
                                            ticks: { stepSize: 1 }
                                        },
                                        x: { title: { display: true, text: 'Date' } }
                                    },
                                    plugins: {
                                        legend: { display: true, position: 'top' },
                                        title: { display: true, text: 'Shipments for the Selected Month' }
                                    }
                                }
                            });
                        </script>
                    <% } %>
                </div>
            <% } %>

            <%
                if (statusCounts != null && !statusCounts.isEmpty()) {
            %>
            <div class="report-section">
                <h3>Shipment Report by Status</h3>
                <div class="report-container">
                    <table>
                        <tr><th>Status</th><th>Count</th></tr>
                        <% for (Map.Entry<String, Long> entry : statusCounts.entrySet()) { %>
                            <tr><td><%= entry.getKey() %></td><td><%= entry.getValue() %></td></tr>
                        <% } %>
                    </table>
                    <canvas id="statusPieChart"></canvas>
                </div>
                <script>
                    const statusLabels = [
                        <% for (Map.Entry<String, Long> entry : statusCounts.entrySet()) { %>
                            "<%= entry.getKey() %>",
                        <% } %>
                    ];
                    const statusData = [
                        <% for (Map.Entry<String, Long> entry : statusCounts.entrySet()) { %>
                            <%= entry.getValue() %>,
                        <% } %>
                    ];
                    const ctx = document.getElementById('statusPieChart').getContext('2d');
                    new Chart(ctx, {
                        type: 'pie',
                        data: {
                            labels: statusLabels,
                            datasets: [{
                                label: 'Shipment Count',
                                data: statusData,
                                backgroundColor: ['#007bff', '#28a745', '#ffc107', '#dc3545', '#17a2b8', '#6f42c1'],
                                borderColor: '#fff',
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: { position: 'bottom', labels: { color: '#333', font: { size: 14 } } },
                                title: { display: true, text: 'Shipments by Status' }
                            }
                        }
                    });
                </script>
            </div>
            <%
                }
            %>
        
            <%
                if (showDateForm != null && showDateForm) {
            %>
            <div class="report-section report-form">
                <h3>Generate Report by Date Range</h3>
                <form method="post" action="${pageContext.request.contextPath}/reports/byDateRange">
                    <label for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate" required value="<%= startDate != null ? dtf.format(startDate) : "" %>" />
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate" required value="<%= endDate != null ? dtf.format(endDate) : "" %>" />
                    <button type="submit">Generate</button>
                </form>
            </div>
            <%
                List<ShipmentDTO> shipmentsList = (List<ShipmentDTO>) request.getAttribute("shipments");
                if (shipmentsList != null) {
            %>
            <div class="report-section">
                <h4>Shipments from <%= dtf.format(startDate) %> to <%= dtf.format(endDate) %></h4>
                <% if (shipmentsList.isEmpty()) { %>
                    <p>No shipments found in the selected date range.</p>
                <% } else { %>
                    <table>
                        <tr><th>ID</th><th>Name</th><th>Origin</th><th>Destination</th><th>Status</th><th>Estimated Date</th></tr>
                        <% for (ShipmentDTO s : shipmentsList) { %>
                            <tr>
                                <td><%= s.getId() %></td>
                                <td><%= s.getName() %></td>
                                <td><%= s.getOrigin() %></td>
                                <td><%= s.getDestination() %></td>
                                <td><%= s.getStatus() %></td>
                                <td><%= s.getEstimatedDate() != null ? s.getEstimatedDate().toString() : "-" %></td>
                            </tr>
                        <% } %>
                    </table>
                <% } %>
            </div>
            <%
                }
            }
            %>
        </div>
    </div>
</body>
</html>