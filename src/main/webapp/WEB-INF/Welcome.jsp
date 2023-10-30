<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
   
    <title>Welcome Page</title>
  </head>
<body>

	<nav class="navbar navbar-expand-lg" style="background-color: #002b80;">
  <a href="#" class="navbar-brand text-white">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link text-white" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled text-white" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <a class="nav-link" href="login.jsp"> 
      <button class="btn btn-outline-success my-2 my-sm-0 text-white">Logout</button>
      </a>
    </form>
  </div>
</nav>
<br>


	<h1 style="padding-left:50px;">Welcome to the homepage. Thanks for choosing our DRM module! </h1>
	<h3 style="padding-left:50px;">Hello, ${user.username}!</h3>
	<br>
	<h5 style="padding-left:50px;">You are currently using:  </h5>
	
	<br>

<form method="POST" action="/saveReplicationOption" style="padding-left:50px;">
     <div class="form-group">
        <label for="selectedTechnique">Replication type</label>
        <select class="form-control" id="selectedTechnique" name="replication_type" style="width: 30%;">
            <option value="Block-level replica">Block-level replica</option>
            <option value="File-level replica">File-level replica</option>
            <option value="MongoDB-level replica">MongoDB-level replica</option>
        </select>
    </div>
    <div class="form-group">
        <label for="selectedMode">Technique</label>
        <select class="form-control" id="selectedMode" name="technique" style="width: 30%;">
            <option value="Active-Active">Active-Active  </option>
            <option value="Active-Passive">Active-Passive</option>
        </select>
    </div>
    <div class="form-group">
        <label for="selectedDirection">Direction</label>
        <select class="form-control" id="selectedDirection" name="direction" style="width: 30%;">
            <option value="Forward">Forward</option>
            <option value="Reverse">Reverse</option>
            <option value="Forward+Reverse">Forward+Reverse</option>
        </select>
    </div>
    <div class="form-group">
        <label for="selectedDirection">Flat file</label>
        <select class="form-control" id="selectedFlatfile" name="flatfile" style="width: 30%;">
            <option value="PostgreSQL">PostgreSQL</option>
            <option value="MongoDb">MongoDb</option>
            <option value="SQL">SQL</option>
        </select>
    </div>
    <br>
    <input type="submit" class="btn btn-primary" style="background-color: #002b80;" value="Save Option">
</form>
<br>
	
	<a href="/register" style="padding-left:50px;"> Navigate to registration </a>
	<br>
	<a href="/login" style="padding-left:50px;"> Navigate to login </a>
	
</body>
</html>