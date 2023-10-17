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

    <title>Simple Login System</title>
</head>
<body>
<div class="container"><br>
    <center><h1>Register</h1></center><br>

    <div class="row">
        <div class="col-2"></div>
        <div class="col-4">
       <!--   <h2><%= request.getAttribute("errorMsg") %></h2>  --> 
       
            <form action="/register" method="post" modelAttribute="registerRequest">
                <label class="form-label">UserName</label>
                <input type="text" class="form-control" name="username">
                <br>

                <label class="form-label">Email</label>
                <input type="text" class="form-control" name="email">
                <br>

                <label class="form-label">Password</label>
                <input type="password" class="form-control" name="password">
                <br>

                <button type="submit" class="btn btn-primary">Register</button>
                <br>
                <a href="/login">Navigate to login</a>
            </form>

        </div>
        <div class="col-4">
            <img alt="" class="img-responsive"
                 src="https://img.freepik.com/free-vector/privacy-policy-concept-illustration_114360-7853.jpg?size=626&ext=jpg&ga=GA1.2.1985589139.1697181929&semt=ais"
                 style="width: 50%; height: 50%; margin-left: 30%">
        </div>
        <div class="col-2"></div>

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
