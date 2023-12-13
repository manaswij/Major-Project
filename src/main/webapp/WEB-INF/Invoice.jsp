<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.postgres.model.ReplicationOption" %>

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
</head>
<body>
<%
    Connection con = null;
    Statement st = null;
    try {
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/myDb", "postgres", "root");
        st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from billing_user_details;");
%>
    
            <div class="card">
    <div class="card-body">
      <div class="container mb-5 mt-3">
        <div class="row d-flex align-items-baseline">
          <div class="col-xl-9">
            <p style="color: #7e8d9f;font-size: 20px;">Invoice New>> <strong>ID: #123-123</strong></p>
          </div>
          <div class="col-xl-3 float-end">
            <a class="btn btn-light text-capitalize border-0" data-mdb-ripple-color="dark"><i
                class="fas fa-print text-primary"></i> Print</a>
            <a class="btn btn-light text-capitalize" data-mdb-ripple-color="dark"><i
                class="far fa-file-pdf text-danger"></i> Export</a>
          </div>
          <hr>
        </div>
  
        <div class="container">
          <div class="col-md-12">
            <div class="text-center">
              <i class="fab fa-mdb fa-4x ms-0" style="color:#5d9fc5 ;"></i>
              <p class="pt-0">Billing Module</p>
            </div>
  
          </div>
  
  
          <div class="row">
            <div class="col-xl-8">
              <ul class="list-unstyled">
                <li class="text-muted">Name: <span style="color:#5d9fc5 ;">John Lorem</span></li>
                <li class="text-muted">Email Id: <span style="color:#5d9fc5 ;">johndoe@gmail.com</span></li>
              </ul>
            </div>
            <div class="col-xl-4">
              <p class="text-muted">Invoice</p>
              <ul class="list-unstyled">
                <li class="text-muted"><i class="fas fa-circle" style="color:#84B0CA ;"></i> <span
                    class="fw-bold">ID:</span>#123-456</li>
                <li class="text-muted"><i class="fas fa-circle" style="color:#84B0CA ;"></i> <span
                    class="fw-bold">Creation Date: </span>Jun 23,2021</li>
                <li class="text-muted"><i class="fas fa-circle" style="color:#84B0CA ;"></i> <span
                    class="fw-bold">End Date: </span>Jun 23,2021</li>
                <li class="text-muted"><i class="fas fa-circle" style="color:#84B0CA ;"></i> <span
                    class="me-1 fw-bold">Status:</span><span class="badge bg-warning text-black fw-bold">
                    Unpaid</span></li>
              </ul>
            </div>
          </div>

            <div class="row my-2 mx-1 justify-content-center">
                <table class="table table-striped table-borderless">
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
                        <%
                            while (rs.next()) {
                        %>
            <tr>
                <td><%= rs.getString("replication_id") %></td>
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
                        <%
                            } 
                        %>
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
              <p class="text-black float-start"><span class="text-black me-3"> Total Amount: </span>
                <!-- <span
                  style="font-size: 25px;">$1221</span></p> -->
            </div>
          </div>
          <hr>
          <div class="row">
            <div class="col-xl-10">
              <p>Thank you for your purchase</p>
            </div>
            <div class="col-xl-2">
              <button type="button" class="btn btn-primary text-capitalize"
                style="background-color:#60bdf3 ;">Pay Now</button>
            </div>
          </div>
          </div>
          </div>
  
<%
    } catch (Exception e) {
        out.print(e.getMessage());
    } finally {
        try {
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            out.print(e.getMessage());
        }
    }
%>
</body>
</html>
