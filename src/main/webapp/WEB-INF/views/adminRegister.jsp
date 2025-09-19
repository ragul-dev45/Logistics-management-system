<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register - Logistics System</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .register-box {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px #aaa;
            width: 400px;
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
        }
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
            background: #28a745;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover {
            background: #218838;
        }
        .link {
            display: block;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="register-box">
        <h2>Register</h2>
        <form action="/adminRegister" method="post">
            <input type="text" name="username" placeholder="Enter Username" required><br>
            <input type="email" name="email" placeholder="Enter Email" required><br>
            <input type="password" name="password" placeholder="Enter Password" required><br>
            <input type="password" name="confirmPassword" placeholder="Confirm Password" required><br>
            <button type="submit">Register</button>
        </form>
        <a href="/login" class="link">Already have an account? Login here</a>
    </div>
</body>
</html>
