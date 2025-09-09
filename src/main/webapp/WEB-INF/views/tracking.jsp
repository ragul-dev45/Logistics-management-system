<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Tracking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 0; }
        .header { background: #004080; color: white; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center; }
        .header h1 { margin: 0; font-size: 20px; }
        .logout-btn { background: #e60000; color: white; border: none; padding: 8px 15px; border-radius: 5px; cursor: pointer; }
        .content { padding: 40px; text-align: center; }

        .progressbar { display: flex; justify-content: space-between; margin: 40px auto; position: relative; width: 80%; }
        .progressbar::before { content: ''; position: absolute; top: 18px; left: 0; width: 100%; height: 4px; background: #d3d3d3; z-index: -1; }
        .step { text-align: center; position: relative; width: 25%; }
        .step .circle { width: 40px; height: 40px; background: #d3d3d3; border-radius: 50%; margin: auto; line-height: 40px; color: white; font-weight: bold; }
        .step.active .circle { background: #28a745; }
        .step p { margin-top: 10px; font-size: 14px; }

        .van { width: 60px; height: 30px; background: #004080; border-radius: 5px; position: absolute; top: -20px; left: 0; transition: left 1s ease-in-out; }
        .wheel { width: 12px; height: 12px; background: black; border-radius: 50%; position: absolute; bottom: -6px; }
        .wheel.left { left: 8px; }
        .wheel.right { right: 8px; }
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

        <div class="van" id="van">
            <div class="wheel left"></div>
            <div class="wheel right"></div>
        </div>
    </div>
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
