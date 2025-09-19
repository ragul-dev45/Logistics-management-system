<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Tracking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background-image: url("images/tracking.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 50% 29%;
            margin: 0; 
        }
        .header { 
            background: #004080; 
            color: white; 
            padding: 15px 20px; 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
        }
        .header h1 { margin: 0; font-size: 20px; }
        .logout-btn { 
            background: #e60000; 
            color: white; 
            border: none; 
            padding: 8px 15px; 
            border-radius: 5px; 
            cursor: pointer; 
        }
        .content { padding: 40px; text-align: center; }

        /* Progress Container */
        .progress-container {
            position: relative;
            width: 80%;
            margin: 20px auto; /* moves the entire block higher */
            height: 70px; /* enough space for van and wheels */
        }

        /* Progress Bar */
        .progressbar {
            display: flex;
            justify-content: space-between;
            position: relative;
            height: 50px; /* space for line and van */
        }

        /* Line behind steps */
        .progressbar::before {
            content: '';
            position: absolute;
            top: 25px;
            left: 0;
            width: 100%;
            height: 4px;
            background: #d3d3d3;
            z-index: 0; /* behind steps */
        }

        .step {
            text-align: center;
            position: relative;
            width: 25%;
            z-index: 1; /* steps above line */
        }

        .step .circle {
            width: 40px;
            height: 40px;
            background: #d3d3d3;
            border-radius: 50%;
            margin: auto;
            line-height: 40px;
            color: white;
            font-weight: bold;
        }

        .step.active .circle { background: #28a745; }
        .step p { margin-top: 10px; font-size: 14px; }

        /* Van (smaller) */
        .van {
            position: absolute;
            bottom: 26px; /* wheels aligned to line */
            left: 0;
            width: 85px;   /* smaller than before */
            height: 30px;
            display: flex;
            align-items: flex-end;
            transition: left 4s ease-in-out;
            z-index: 2; /* above line */
        }

        .box {
            width: 50px;
            height: 22px;
            background: #ffcc00;
            border-radius: 4px;
            position: relative;
        }
        .box::after {
            content: "DELIVERY";
            position: absolute;
            top: 6px;
            left: 5px;
            font-family: Arial, sans-serif;
            font-size: 8px;
            font-weight: bold;
            color: #333;
        }

        .cab {
            width: 35px;
            height: 22px;
            background: #3498db;
            border-radius: 4px;
            position: relative;
            margin-left: -5px;
            clip-path: polygon(0 0, 100% 0, 100% 100%, 25% 100%);
        }

        .window {
            width: 14px;
            height: 9px;
            background: #87ceeb;
            position: absolute;
            top: 4px;
            right: 4px;
            border-radius: 3px;
        }

        /* Wheels */
        .wheel {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: #222;
            border: 2px solid #555;
            position: absolute;
            bottom: -6px;
            overflow: hidden;
        }
        .wheel .rim {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            border: 2px solid #555;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 2;
        }
        .wheel .spoke {
            width: 2px;
            height: 100%;
            background: #999;
            position: absolute;
            left: 50%;
            top: 0;
            transform-origin: center;
            animation: spin 1s linear infinite;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        .wheel.back { left: 5px; }
        .wheel.front { left: 60px; }

        /* Smoke */
        .smoke-container {
            position: absolute;
            bottom: 5px;
            left: -12px;
        }
        .smoke-container .smoke {
            position: absolute;
            width: 10px;
            height: 10px;
            background: rgba(50,50,50,0.95);
            border-radius: 50%;
            animation: smoke 1.5s ease-out infinite;
        }
        .smoke:nth-child(1) { animation-delay: 0s; left: 0px; }
        .smoke:nth-child(2) { animation-delay: 0.3s; left: 4px; }
        .smoke:nth-child(3) { animation-delay: 0.6s; left: 8px; }

        @keyframes smoke {
            0% { transform: scale(0.5); opacity: 0.9; }
            50% { transform: scale(1.2) translateY(-15px); opacity: 0.6; }
            100% { transform: scale(2) translateY(-30px); opacity: 0; }
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
        .back-btn:hover { background: #5a6268; }
    </style>
</head>
<body>

<div class="header">
    <h1>GLOBAL REACH Logistics</h1>
    <form action="<c:url value='/logout' />" method="get" style="margin:0;">
        <button class="logout-btn" type="submit">Logout</button>
    </form>
</div>

<div class="content">
    <h2>Order Tracking for ${username}</h2>

    <div class="progress-container">
        <div class="progressbar">
            <div class="step">
                <div class="circle">1</div>
                <p>Pickup</p>
            </div>
            <div class="step">
                <div class="circle">2</div>
                <p>Shipped</p>
            </div>
            <div class="step">
                <div class="circle">3</div>
                <p>Out for Delivery</p>
            </div>
            <div class="step">
                <div class="circle">4</div>
                <p>Delivered</p>
            </div>

            <!-- Van -->
            <div class="van" id="van">
                <div class="box"></div>
                <div class="cab">
                    <div class="window"></div>
                </div>
                <div class="wheel back">
                    <div class="rim"></div>
                    <div class="spoke"></div>
                </div>
                <div class="wheel front">
                    <div class="rim"></div>
                    <div class="spoke"></div>
                </div>
                <div class="smoke-container">
                    <div class="smoke"></div>
                    <div class="smoke"></div>
                    <div class="smoke"></div>
                </div>
            </div>
        </div>
    </div>

    <a href="/dashboard" class="back-btn">Back</a>
</div>

<script>
    function updateTracking() {
        fetch('<c:url value="/tracking/status" />')
            .then(response => response.text())
            .then(status => {
                const van = document.getElementById("van");
                const steps = document.querySelectorAll(".step");
                steps.forEach(s => s.classList.remove("active"));

                let leftPos = "0%";
                switch(status) {
                    case "Pickup": leftPos="5%"; steps[0].classList.add("active"); break;
                    case "Shipped": leftPos="30%"; steps[1].classList.add("active"); break;
                    case "Out for Delivery": leftPos="60%"; steps[2].classList.add("active"); break;
                    case "Delivered": leftPos="90%"; steps[3].classList.add("active"); break;
                    default: leftPos="0%";
                }

                van.style.left = leftPos;
            });
    }

    updateTracking();
    setInterval(updateTracking, 50000);
</script>

</body>
</html>
