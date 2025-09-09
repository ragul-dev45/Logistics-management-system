<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Logistics Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background: url('${pageContext.request.contextPath}/images/logistics1.jpg') no-repeat center center fixed;
            background-size: cover; /* Makes it cover the full screen */
        }

        /* Dark overlay for readability */
        .overlay {
            background-color: rgba(0, 0, 0, 0.6);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 50px;
        }

        .center-section {
            text-align: center;
            flex: 2;
            color: white;
        }
        .center-section h1 {
            font-size: 36px;
            margin-bottom: 10px;
        }
        .center-section p {
            font-size: 18px;
            margin-bottom: 20px;
        }

        .right-section {
            flex: 1;
            text-align: center;
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px #000;
            margin-left: 30px;
        }

        .btn {
            display: block;
            padding: 12px 25px;
            margin: 15px auto;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            transition: background 0.3s;
            width: 80%;
        }
        .btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="overlay">

        <!-- Center section (Title + Welcome) -->
        <div class="center-section">
            <h1>GLOBAL REACH Logistics</h1>
            <p>Welcome! Manage shipments, Track deliveries, and Generate reports easily.</p>
        </div>

        <!-- Right section (Login/Register) -->
        <div class="right-section">
            <h2>Get Started</h2>
            <a href="/login" class="btn">Login</a>
            <a href="/register" class="btn">Register</a>
        </div>

    </div>
</body>
</html>
