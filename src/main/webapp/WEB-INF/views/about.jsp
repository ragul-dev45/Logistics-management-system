<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About - GLOBAL REACH PVT LTD</title>
    <style type="text/css">
    
     body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background: url('${pageContext.request.contextPath}/images/logistics1.jpg') no-repeat center center fixed;
            background-size: cover; /* Makes it cover the full screen */
        }

        .about-box {
            background-color: rgba(0, 123, 255, 0.85); /* Blue with transparency */
            color: white; /* White text on blue background */
            border-radius: 12px;
            padding: 25px;
            border: 2px solid #004085; /* Darker blue border */
        }

        .about-box ul li {
            color: #f8f9fa; /* Light text for list items */
        }

        h2 {
            color: #ffffff; /* White heading */
            text-shadow: 1px 1px 3px rgba(0,0,0,0.6);
        }
        
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">About GLOBAL REACH</h2>

    <div class="about-box shadow">
        <p>
            The <strong>GLOBAL REACH LOGISTICS</strong> is designed to simplify and
            automate logistics operations including <em>tracking, shipments, scheduling, and reporting</em>.
            It helps businesses improve supply chain visibility, reduce costs, and deliver goods on time.
        </p>

        <p>
            Our system enables users to:
        </p>
        <ul>
            <li>Track shipments in real-time</li>
            <li>Manage delivery schedules with an integrated calendar</li>
            <li>Generate detailed reports for analysis</li>
            <li>Enhance customer satisfaction with transparency</li>
            <li>Improve efficiency and reduce manual errors</li>
        </ul>

        <p>
            Logistics plays a vital role in connecting businesses and customers.
            By using LMS, companies can achieve better operational efficiency and
            provide high-quality service to their clients.
        </p>
    </div>

    <div class="text-center mt-4">
        <a href="/" class="btn btn-light">⬅ Back to Dashboard</a>
    </div>
</div>
</body>
</html>
