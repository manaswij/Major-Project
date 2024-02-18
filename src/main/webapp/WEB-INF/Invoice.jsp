<!-- Invoice.jsp -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.postgres.model.ReplicationOption" %>
<%@ page import="com.postgres.model.UsersModel" %>
<%@ page import="com.postgres.service.UsersService" %>
<%@ page import="com.postgres.service.UsersService" %>
<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>


<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Add Bootstrap CSS and jQuery -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <!-- Add Bootstrap Datepicker CSS and JS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.8.0/html2pdf.bundle.min.js"></script>
    <!-- Add this script tag in your HTML file -->
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
    <style>
    /* Add this style to your existing styles or in the head section */
    .btn-light {
        background-color: #e2e2e2 !important;
        color: #000000 !important; /* Change the text color if needed */
    }

    .btn-light:hover {
        background-color: #F2F2F2 !important;
        color: #000000 !important; /* Change the text color if needed */
    }
</style>
    
</head>
<body>
<%
WebApplicationContext applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(application);

//Retrieve the UsersService bean from the application context
UsersService userService = applicationContext.getBean(UsersService.class);

Connection con = null;
PreparedStatement preparedStatement = null;
ResultSet rs = null;

double grandTotal = 0.0; // Initialize grand total variable

try {
    Class.forName("org.postgresql.Driver");
    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/myDb", "postgres", "root");

    // Get the logged-in user from the session
    UsersModel loggedInUser = (UsersModel) session.getAttribute("user");
    int userId = loggedInUser.getUserId(); // Get the user ID

 // Fetch the user details from the database based on the userId
    UsersModel userDetails = userService.getUserByUserId(userId);
    String fullname = userDetails.getFullName();
    String email = userDetails.getEmail();
    
    // Prepare the SQL statement with a parameterized query to avoid SQL injection
    String sqlQuery = "SELECT * FROM billing_user_details WHERE user_id = ?";
    preparedStatement = con.prepareStatement(sqlQuery);
    preparedStatement.setInt(1, userId);

    // Execute the query
    rs = preparedStatement.executeQuery();

%>
    
    
            <div class="card">
    <div class="card-body">
      <div class="container mb-5 mt-3">
        <div class="row d-flex align-items-baseline">
          
          <div class="col-xl-3 float-end">
    <a class="btn btn-light text-capitalize border-0" data-mdb-ripple-color="dark" style="background-color: #e2e2e2;">
        <i class="fas fa-print text-primary" id="download"></i> Download PDF
    </a>
    <a href="/login" class="btn btn-light text-capitalize border-0" data-mdb-ripple-color="dark" style="background-color: #e2e2e2;">
        <i class="fas fa-print text-primary" id="download"></i> Logout
    </a>
</div>

          <hr>
        </div>
  
        <div class="container">
          <div class="col-md-12">
            <div class="text-center">
              <i class="fab fa-mdb fa-4x ms-0" style="color:#5d9fc5 ;"></i>
              <h4 class="pt-0">Invoice Details</h4>
            </div>
  
          </div>
  
  
          <div class="row">
            <div class="col-xl-8">
              <ul class="list-unstyled">
 	<li class="text-muted">Name: <span style="color:#5d9fc5 ;"><%= fullname %></span></li>
    <li class="text-muted">Email Id: <span style="color:#5d9fc5 ;"><%= email %></span></li>
              </ul>
            </div>
             <%
                        while (rs.next()) {
                            
                                                %>
            <div class="col-xl-4" id = "invoice">
              <ul class="list-unstyled">
                <li class="text-muted"><i class="fas fa-circle" style="color:#84B0CA ;"></i> <span
                    class="fw-bold">Invoice Id:</span><%= rs.getString("common_id2") %></li>
                <li class="text-muted"><i class="fas fa-circle" style="color:#84B0CA ;"></i> <span
                    class="me-1 fw-bold">Status:</span><span class="badge bg-warning text-black fw-bold">
                    Unpaid</span></li>
              </ul>
            </div>
          </div>

            <div class="row my-2 mx-1 justify-content-center">
                <table class="table table-striped table-borderless" style="padding:100%;">
                    <thead style="background-color:#002b80 ;" class="text-white">
            <tr>
                <th>ID</th>
                <th>Technique</th>
                <th>Direction</th>
                <th>Replication Type</th>
                <th>Flatfile</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>No. of Days</th>
                <th>No. of Bytes</th>
                <th>Charge of One Byte</th>
                <th>Total Amount</th>
            </tr>
                    </thead>
                    <tbody>
                       
            <tr>
                <td><%= rs.getString("user_id") %></td>
                <td><%= rs.getString("technique") %></td>
                <td><%= rs.getString("direction") %></td>
                <td><%= rs.getString("replication_type") %></td>
                <td><%= rs.getString("flatfile") %></td>
                <td><%= rs.getString("start_date") %></td>
                <td><%= rs.getString("end_date") %></td>
                <td><%= rs.getString("no_of_days") %></td>
                <td><%= rs.getString("number_of_bytes") %></td>
                <td><%= rs.getString("charge_of_one_byte") %></td>
                <td><%= rs.getString("total_amount") %></td>
                
            </tr>
                        
                    </tbody>
                </table>
            </div>
            
            <!-- Rest of your HTML code -->

        </div>
    </div>
              <div class="row">
            <div class="col-xl-8">
              <!-- <p class="ms-3">Add additional notes and payment information</p> -->
  
            </div>
            <div class="col-xl-3">
              <!-- <ul class="list-unstyled">
                <li class="text-muted ms-3"><span class="text-black me-4">SubTotal</span>$1110</li>
                <li class="text-muted ms-3 mt-2"><span class="text-black me-4">Tax(15%)</span>$111</li>
              </ul> -->
              <p class="text-black float-start">
 <h6 class="text-black float-start"><span class="text-black me-3" style="margin-left: -40px;"> Total Amount: Rs.<%= rs.getString("total_amount") %>/-</span> </h6>               
<!-- <span
                  style="font-size: 25px;">$1221</span> -->
                  
                       
            </div>
            
          </div>
          <div class="row">
            <div class="col-xl-10" >
              <h5 style="margin-left:40%; margin-top:20px">Thank you for your purchase!</h5>
            </div>
            <!-- Pay Now button linking to payment.jsp -->
			<div class="col-xl-2">
<a href="#" class="btn btn-success mt-3" style="margin-left: -90%; margin-top: 20px" onclick="initiatePayment(<%= rs.getString("total_amount") %>)">Pay Now</a>
    <a href="/plan" class="btn btn-primary mt-3" style="margin-left: -90%; margin-top: 20px">Renew Plan</a>
</div>
 						<%
                            } 
                        %>
</div>

          </div>
          </div>
          
          <script>
          function initiatePayment(amount) {
        	    var options = {
        	        "key": "rzp_test_HQK3ZTPsNUZccc",
        	        "amount": amount * 100, // amount in paisa
        	        "currency": "INR",
        	        "name": "Your Company Name",
        	        "description": "Payment for Services",
        	        "image": "path/to/your/logo.png",
        	        "handler": function (response){
        	            // Handle payment success
        	            alert("Payment successful! Payment ID: " + response.razorpay_payment_id);
        	            // Redirect or perform any other action
        	        },
        	        "prefill": {
        	            "name": "User Name",
        	            "email": "user@example.com"
        	        },
        	        "theme": {
        	            "color": "#002b80"
        	        }
        	    };
        	    var rzp = new Razorpay(options);
        	    rzp.open();
        	}


          
    $(document).ready(function () {
        // Add click event listener to the Download PDF button
        $(".btn-light").click(function () {
            // Get the HTML content of the page
            var content = document.documentElement.outerHTML;

            // Use html2pdf library to generate PDF
            html2pdf(content, {
                margin: 10,
                filename: 'invoice.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'mm', format: '4a', orientation: 'landscape' }
            });
        });
    });
    
</script>
  
<%
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace(); // Handle any exceptions, you might want to log or display an error message
} finally {
    // Close resources in the finally block
    try {
        if (rs != null) {
            rs.close();
        }
        if (preparedStatement != null) {
            preparedStatement.close();
        }
        if (con != null) {
            con.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

%>
</body>
</html>