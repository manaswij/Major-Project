<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Success</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            text-align: center;
            margin-top: 50px;
        }

        .success-icon {
            font-size: 72px;
            color: #28a745;
        }

        .success-message {
            font-size: 24px;
            color: #28a745;
            margin-top: 20px;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        #loading-container,
        #success-message {
          margin-left: 42rem;
          color:#5e5f60; 
        }

        

        .loading-spinner {
            border: 8px solid rgba(0, 0, 0, 0.3);
            border-top: 8px solid #359aae;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
            margin: 0 auto;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

        .hidden {
            display: none;
        }
    </style>
</head>

<body>
    <div id="loading-container">
        <div class="loading-spinner"></div>
        <br>
        <h5> Processing your payment... </h5>
        
    </div>

    <div class="container">
        <i class="fas fa-check-circle success-icon hidden"></i>
        <h1 class="success-message hidden">Payment Done Successfully</h1>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Font Awesome JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Show loading spinner initially
            simulatePaymentProcessing();

            // After 5 seconds, hide loading spinner and display success message
            setTimeout(function () {
                hideLoadingSpinner();
                displayPaymentSuccessful();
            }, 5000);
        });

        function simulatePaymentProcessing() {
            // You can customize this function to simulate your payment processing logic
            console.log('Processing payment...');
        }

        function hideLoadingSpinner() {
            // Hide loading container
            document.getElementById('loading-container').style.display = 'none';
        }

        function displayPaymentSuccessful() {
            // Display success message
            document.querySelector('.success-icon').classList.remove('hidden');
            document.querySelector('.success-message').classList.remove('hidden');
        }
    </script>
</body>

</html>
