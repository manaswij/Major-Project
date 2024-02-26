<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f6f7f7;
        }

        .container {
            max-width: 900px;
            margin-top: 20px;
        }

        .register-form {
            background-color: #fff;
            border-radius: 8px;
            padding: 40px; /* Decreased padding */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .register-heading {
            text-align: center;
            margin-bottom: 20px; /* Decreased margin */
        }

        .register-form label {
            font-weight: bold;
        }

        .register-form input[type="text"],
        .register-form input[type="password"] {
            border-radius: 4px;
            border: 1px solid #ced4da;
            padding: 10px;
            width: 100%;
        }

        .register-form button[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
        }

        .login-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .register-image img {
            margin-top: 10vh;
            width: 100%;
            height: auto;
        }
    </style>

    <title>Simple Login System</title>
</head>
<body>
<div class="container">
    <div class="register-form">
        <div class="row">
            <div class="col-lg-6">
                <h1 class="register-heading">Register</h1>
                <form action="/register" method="post" modelAttribute="registerRequest">
                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" class="form-control" name="fullName" required>
                    </div>
                    <div class="form-group">
                        <label>Username</label>
                        <input type="text" class="form-control" name="username" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" class="form-control" name="email" required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Register</button>
                    <p class="text-danger">${errorMsg}</p>
                </form>
                <a href="/login" class="login-link">Already have an account? Login here.</a>
            </div>
            <div class="col-lg-6">
                <div class="register-image">
                    <img src="https://img.freepik.com/free-vector/privacy-policy-concept-illustration_114360-7853.jpg?size=626&ext=jpg&ga=GA1.2.1985589139.1697181929&semt=ais"
                         alt="Privacy Policy Illustration">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkwCAc1r8xW3nrWVd7IyRTbI5z3w/C6D5L0Ktu8vHvMvY7ZqO R4H"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
