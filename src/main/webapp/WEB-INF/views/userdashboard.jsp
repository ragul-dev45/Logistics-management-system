<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Dashboard - Logistics</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #00FFEF;
            margin: 0;
            padding: 0;
        }
        header {
            background: #007bff;
            color: #fff;
            padding: 15px;
            text-align: center;
        }
        nav {
            background: #333;
            padding: 10px;
        }
        nav a {
            color: #fff;
            margin: 0 15px;
            text-decoration: none;
            font-weight: bold;
        }
        nav a:hover {
            text-decoration: underline;
        }
        .container {
            padding: 20px;
            text-align: center;
        }
        .module-grid {
            display: flex;
            flex-direction: column; /* stack items vertically */
            gap: 20px;
            margin-top: 30px;
            align-items: center; /* center align horizontally */
        }
        .card {
            background: #fff;
            padding: 20px;
            width: 400px; /* fixed width for neat look */
            text-align: center;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0,0,0,0.2);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .logout {
            float: right;
            margin-top: -40px;
            margin-right: 20px;
        }
        .logout a {
            color: #fff;
            text-decoration: none;
            background: #dc3545;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .logout a:hover {
            background: #a71d2a;
        }
    </style>
</head>
<body>
<header>
    <h1>Logistics Dashboard</h1>
    <div class="logout">
        <a href="login">Logout</a>
    </div>
</header>

<nav>
    <a href="tracking">Tracking</a>
    <a href="shipments">Shipments</a>
    <a href="calendar">Calendar</a>
    <a href="report">Report</a>
    <a href="about">About</a>
</nav>

<div class="container">
    <h2>Welcome to USER Dashboard!</h2>
    <div class="module-grid">
        <div class="card"><a href="tracking">📍 Tracking</a></div>
        <div class="card"><a href="shipments">🚚 Shipments</a></div>
        <div class="card"><a href="calendar">📅 Calendar</a></div>
        <div class="card"><a href="report">📊 Report</a></div>
        <div class="card"><a href="about">ℹ️ About</a></div>
    </div>
</div>
</body>
</html>
