<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            margin-top: 60px;
        }

        .login-form {
            background-color: #fff;
            border-radius: 8px;
            padding: 50px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .login-heading {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-form label {
            font-weight: bold;
        }

        .login-form input[type="text"],
        .login-form input[type="password"] {
            border-radius: 4px;
            border: 1px solid #ced4da;
            padding: 10px;
            width: 100%;
        }

        .login-form .form-check-label {
            font-weight: normal;
        }

        .login-form button[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
        }

        .register-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .login-image img {
            width: 100%;
            height: auto;
        }
    </style>

    <title>Simple Login System</title>
</head>
<body>
    <div class="container">
        <div class="login-form">
            <div class="row">
                <div class="col-lg-6">
                    <h1 class="login-heading">Login</h1>
                    <form action="login" method="post" modelAttribute="loginRequest">
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" class="form-control" name="username" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Remember Me</label>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                        <p class="text-danger">${errorMsg}</p>
                    </form>
                    <a href="/register" class="register-link">Don't have an account? Register here.</a>
                </div>
                <div class="col-lg-6">
                    <div class="login-image">
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
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
