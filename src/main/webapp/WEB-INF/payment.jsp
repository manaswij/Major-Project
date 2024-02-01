<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment Gateway</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Font Awesome CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
  <style>
    body {
      background-color: #f8f9fa;
    }

    .container {
      background-color: #ffffff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      border-radius: 8px;
      margin-top: 60px;
      width: 33rem; 
    }

    .payment-icon {
      font-size: 24px;
      margin-right: 10px;
    }

    #paymentMethod {
      width: 30rem;
    }

    #creditCardFields {
      padding: 1px;
      width: 30rem;
    }

    .cvv-container {
      position: relative;
    }

    .cvv-toggle {
      position: absolute;
      top: 50%;
      right: 10px;
      transform: translateY(-50%);
      cursor: pointer;
      margin-top: 25px; /* Add margin-bottom to adjust the position */
    }
  </style>
</head>
<body>

<div class="container mt-5">
  <h2 style="margin-left: 100px;">Payment Gateway</h2>
  <form id="paymentForm" style="margin-top: 40px;">
    <div class="form-group">
      <label for="paymentMethod">Select Payment Method:</label>
      <select class="form-control" id="paymentMethod" onchange="togglePaymentFields()">
        <option value="creditCard">Credit Card</option>
        <option value="debitCard">Debit Card</option>
        <option value="upi">UPI</option>
      </select>
    </div>

    <div class="form-group" id="creditCardFields">
      <label for="cardNumber" style="padding: 5px;">Card Number:</label>
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text"><i class="fab fa-cc-visa payment-icon"></i></span>
        </div>
        <input type="text" class="form-control" id="cardNumber" placeholder="Enter card number" style="padding: 10px;">
      </div>
      <label for="expiryDate" style="padding: 10px;">Expiry Date:</label>
      <input type="text" class="form-control" id="expiryDate" placeholder="MM/YY" style="padding: 10px;">

      <div class="form-group cvv-container">
        <label for="cvv" style="padding: 10px;">CVV:</label>
        <input type="password" class="form-control" id="cvv" placeholder="Enter CVV" style="padding: 10px;">
        <i class="far fa-eye cvv-toggle" onclick="toggleCVVVisibility()"></i>
      </div>
    </div>

    <div class="form-group" id="upiFields" style="display:none;">
      <label for="upiId">UPI ID:</label>
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text"><i class="fas fa-mobile-alt payment-icon"></i></span>
        </div>
        <input type="text" class="form-control" id="upiId" placeholder="Enter UPI ID">
      </div>
      <label for="qrCode">QR Code:</label>
      <input type="file" class="form-control-file" id="qrCode">
    </div>

<div>
	<a href ="/paysuccess" class="btn btn-success mt-3" style="margin-left:10rem ;">Submit Payment</a>
</div>    
  </form>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Font Awesome JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"></script>

<script>
  function togglePaymentFields() {
    var paymentMethod = document.getElementById("paymentMethod").value;
    var creditCardFields = document.getElementById("creditCardFields");
    var upiFields = document.getElementById("upiFields");

    if (paymentMethod === "creditCard" || paymentMethod === "debitCard") {
      creditCardFields.style.display = "block";
      upiFields.style.display = "none";
    } else if (paymentMethod === "upi") {
      creditCardFields.style.display = "none";
      upiFields.style.display = "block";
    }
  }

  function toggleCVVVisibility() {
    var cvvInput = document.getElementById("cvv");
    var cvvToggle = document.querySelector(".cvv-toggle");

    if (cvvInput.type === "password") {
      cvvInput.type = "text";
      cvvToggle.classList.remove("far", "fa-eye");
      cvvToggle.classList.add("far", "fa-eye-slash");
    } else {
      cvvInput.type = "password";
      cvvToggle.classList.remove("far", "fa-eye-slash");
      cvvToggle.classList.add("far", "fa-eye");
    }
  }
</script>

</body>
</html>
