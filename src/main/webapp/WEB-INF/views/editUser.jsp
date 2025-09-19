<html>
<head>
    <title>Edit User</title>
    <!-- Font Awesome CDN for eye icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <style>
        /* Body styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #47c7ab;
            color: #333;
            margin: 20px;
        }

        /* Heading */
        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        /* Form container */
        form {
            width: 400px;
            margin: 0 auto;
            padding: 25px;
            background-color: #ffffff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        /* Labels */
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #2c3e50;
        }

        /* Inputs */
        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 8px 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        /* Password wrapper to position eye */
        .password-wrapper {
            position: relative;
        }

        .password-wrapper input {
            width: 100%;
            padding-right: 35px; /* space for eye icon */
        }

        /* Eye icon styling */
        .toggle-password {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 18px;
            color: #666;
            transition: all 0.2s ease;
        }

        .toggle-password:hover {
            color: #3498db; /* color on hover */
            transform: translateY(-50%) scale(1.2); /* enlarge slightly */
        }

        /* Buttons */
        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        a.cancel-btn {
            text-decoration: none;
            color: #e74c3c;
            font-weight: bold;
        }

        a.cancel-btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>Edit User</h2>
<form action="${pageContext.request.contextPath}/users/edit/${user.id}" method="post">
    <label>Username:</label>
    <input type="text" name="username" value="${user.username}" required/>

    <label>Email:</label>
    <input type="email" name="email" value="${user.email}" required/>

    <label>Password:</label>
    <div class="password-wrapper">
        <input type="password" name="password" id="password" value="${user.password}" required/>
        <span class="toggle-password" id="togglePassword">
            <i class="fa-solid fa-eye"></i>
        </span>
    </div>

    <label>Role:</label>
    <select name="role">
        <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>USER</option>
        <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
    </select>

    <input type="submit" value="Update"/>
    <a href="${pageContext.request.contextPath}/users" class="cancel-btn">Cancel</a>
</form>

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
