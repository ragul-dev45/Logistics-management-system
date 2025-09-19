<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login - Logistics System</title>
    <!-- Font Awesome CDN for eye icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('${pageContext.request.contextPath}/images/login.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background: #a0d6d3;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px #aaa;
            width: 350px;
            text-align: center;
        }
        h2 { margin-bottom: 20px; }
        input {
            width: 90%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        button {
            width: 95%;
            padding: 12px;
            margin-top: 15px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover { background: #0056b3; }
        .link { display: block; margin-top: 15px; }
        .error {
            color: red;
            margin-top: 10px;
            font-weight: bold;
        }

        /* Password wrapper for eye icon */
        .password-wrapper {
            position: relative;
        }

        .password-wrapper input {
            width: 90%;
            padding-right: 35px; /* space for eye icon */
        }

        /* Eye icon styling */
        .toggle-password {
            position: absolute;
            top: 50%;
            right: 11%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 18px;
            color: #666;
            transition: all 0.2s ease;
        }

        .toggle-password:hover {
            color: #007bff;
            transform: translateY(-50%) scale(1.2);
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Login</h2>
        <form action="/login" method="post">
            <input type="text" name="username" placeholder="Enter Username" required><br>

            <div class="password-wrapper">
                <input type="password" name="password" id="password" placeholder="Enter Password" required><br>
                <span class="toggle-password" id="togglePassword">
                    <i class="fa-solid fa-eye"></i>
                </span>
            </div>

            <button type="submit">Login</button>
        </form>

        <%
            String error = (String) request.getAttribute("error");
            Boolean loginAttempted = (Boolean) request.getAttribute("loginAttempted");

            if (Boolean.TRUE.equals(loginAttempted) && error != null && !error.trim().isEmpty()) {
        %>
            <div id="errorMsg" class="error"><%= error %></div>
            <script>
                // Hide error message after 3 seconds
                setTimeout(() => {
                    const msg = document.getElementById("errorMsg");
                    if (msg) msg.style.display = "none";
                }, 3000);
            </script>
        <%
            }
        %>

        <a href="/register" class="link">New user? Register here</a>
    </div>

    <script>
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('password');

        togglePassword.addEventListener('click', function() {
            const icon = this.querySelector('i');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });
    </script>
</body>
</html>
