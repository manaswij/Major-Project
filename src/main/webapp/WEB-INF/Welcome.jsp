<!-- Welcome.jsp -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

    <title>Welcome Page</title>
    <style>
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg" style="background-color: #002b80;">
        <a href="#" class="navbar-brand">
            <a href="https://ibb.co/2F8LpzG"><img src="https://i.ibb.co/K5NQ8tT/C-DAC-processed.png" alt="C-DAC-processed" style="width: 100px; height: auto;">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link text-white" href="/plan">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="#">Overview</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Reports
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-white" href="#">Support</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-white" href="#">Documentation</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link disabled text-white" href="#">About Us</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <div class="nav-link">
                    <a href="/login" class="btn btn-outline-success my-2 my-sm-0 text-white">
                        Logout
                    </a>
                </div>
            </form>
        </div>
    </nav>

    <!-- Place the image outside the nav -->
    <div class="row gx-4 gx-lg-5 align-items-center my-5" style="position: absolute; top: 6vh; left: 120vh; margin: 20px;">
        <div class="col-lg-10">
            <img class="img-fluid rounded mb-4 mb-lg-0" src="https://www.scnsoft.com/financial-management-software/automated-billing-system/automated-billing-system-cover-picture.svg">
            <p style="font-size: 16px;">
                Please note the following byte ranges for each type of replication:
                <br>
                <br>
                <b>File-level Replication:</b>This replication method operates on individual files. For optimal performance, we recommend file sizes ranging from 1 MB to 100 MB.<br>
                <br>
                <b>Block-level Replication:</b>Block-level replication focuses on smaller units within files, enhancing efficiency. Ideal block sizes typically fall between 1 MB  and 4 MB.<br>
                <br>
                <b>MongoDB Replication:</b>MongoDB replication involves replicating data at the document level. To ensure smooth replication, document sizes should ideally range from 1 MB to 16 MB.
            </p>
        </div>
    </div>
    

    <br>

    <h1 style="padding-left:50px;"> Thanks for choosing our DRM module! </h1>
    <h3 style="padding-left:50px;">Hello, ${user.username}!</h3>
    <br>
    <h5 style="padding-left:50px;">You are currently using: </h5>

    <br>

    <form method="POST" action="/saveReplicationOption" style="padding-left:50px;">
        <div class="form-group">
            <label for="selectedReplicationType">Replication type</label>
            <select class="form-control" id="selectedReplicationType" name="replication_type"
                style="width: 30%;" onchange="handleReplicationTypeChange()">
                <option value="">-- Select --</option>
                <option value="Block-level replica">Block-level replica</option>
                <option value="File-level replica">File-level replica</option>
                <option value="MongoDB-level replica">MongoDB-level replica</option>
            </select>
        </div>

        <div class="form-group" id="techniqueDropdown" style="display: none;">
            <label for="selectedTechnique">Technique</label>
            <select class="form-control" id="selectedTechnique" name="technique"
                style="width: 30%;" onchange="handleTechniqueChange()">
                <option value="">-- Select --</option>
                <option value="Active">Active</option>
                <option value="Passive">Passive</option>
                <option value="Active+Passive">Active + Passive</option>
            </select>
        </div>

        <div class="form-group" id="flatfileDropdown" style="display: none;">
            <label for="selectedFlatfile">Flat file</label>
            <select class="form-control" id="selectedFlatfile" name="flatfile"
                style="width: 30%;" onchange="handleFlatfileChange()">
                <option value="">-- Select --</option>
                <option value="PostgreSQL">PostgreSQL</option>
                <option value="MongoDb">MongoDb</option>
                <option value="SQL">SQL</option>
            </select>
        </div>

        <div class="form-group" id="directionDropdown" style="display: none;">
            <label for="selectedDirection">Direction</label>
            <select class="form-control" id="selectedDirection" name="direction"
                style="width: 30%;" onchange="handleDirectionChange()">
                <option value="">-- Select --</option>
                <option value="Forward">Forward</option>
                <option value="Reverse">Reverse</option>
                <option value="Forward+Reverse">Forward+Reverse</option>
            </select>
        </div>

        <div class="form-group" id="startdate" style="display: none;">
            <label for="startDate">Start Date</label>
            <!-- Use type="date" to create a date input with a date picker -->
            <input type="date" class="form-control" id="startDate" name="startDate" style="width: 30%;"
                onchange="handleStartDateChange()">
        </div>

        <div class="form-group" id="bytesInput" style="display: none;">
    <label for="numberOfBytes">No. of Bytes</label>
    <input type="number" class="form-control" step="0.01" min="1.0" required id="numberOfBytes" name="numberOfBytes" style="width: 30%;">
</div>


        <br>
        <input type="submit" class="btn btn-success" style="background-color: #28a745;" value="Generate Invoice">
    </form>
    <br>

    <script>
        function handleReplicationTypeChange() {
            var replicationTypeDropdown = document.getElementById("selectedReplicationType");
            var techniqueDropdown = document.getElementById("techniqueDropdown");
            var flatfileDropdown = document.getElementById("flatfileDropdown");
            var directionDropdown = document.getElementById("directionDropdown");
            var startDateField = document.getElementById("startdate");
            var bytesInput = document.getElementById("bytesInput");

            if (replicationTypeDropdown.value !== "") {
                techniqueDropdown.style.display = "block";
                flatfileDropdown.style.display = "none";
                directionDropdown.style.display = "none";
                startDateField.style.display = "none";
                bytesInput.style.display = "none";
            } else {
                techniqueDropdown.style.display = "none";
                flatfileDropdown.style.display = "none";
                directionDropdown.style.display = "none";
                startDateField.style.display = "none";
                bytesInput.style.display = "none";
            }
        }

        function handleTechniqueChange() {
            var techniqueDropdown = document.getElementById("selectedTechnique");
            var flatfileDropdown = document.getElementById("flatfileDropdown");
            var directionDropdown = document.getElementById("directionDropdown");
            var startDateField = document.getElementById("startdate");
            var bytesInput = document.getElementById("bytesInput");

            if (techniqueDropdown.value !== "") {
                flatfileDropdown.style.display = "block";
                directionDropdown.style.display = "none";
                startDateField.style.display = "none";
                bytesInput.style.display = "none";
            } else {
                flatfileDropdown.style.display = "none";
                directionDropdown.style.display = "none";
                startDateField.style.display = "none";
                bytesInput.style.display = "none";
            }
        }

        function handleFlatfileChange() {
            var flatfileDropdown = document.getElementById("selectedFlatfile");
            var directionDropdown = document.getElementById("directionDropdown");
            var startDateField = document.getElementById("startdate");
            var bytesInput = document.getElementById("bytesInput");

            if (flatfileDropdown.value !== "") {
                directionDropdown.style.display = "block";
                startDateField.style.display = "none";
                bytesInput.style.display = "none";
            } else {
                directionDropdown.style.display = "none";
                startDateField.style.display = "none";
                bytesInput.style.display = "none";
            }
        }

        function handleDirectionChange() {
            var directionDropdown = document.getElementById("selectedDirection");
            var startDateField = document.getElementById("startdate");
            var bytesInput = document.getElementById("bytesInput");

            if (directionDropdown.value !== "") {
                startDateField.style.display = "block";
                bytesInput.style.display = "none";
            } else {
                startDateField.style.display = "none";
                bytesInput.style.display = "none";
            }
        }

        function handleStartDateChange() {
            var startDateField = document.getElementById("startdate");
            var bytesInput = document.getElementById("bytesInput");

            if (startDateField.style.display !== "none") {
                bytesInput.style.display = "block";
            } else {
                bytesInput.style.display = "none";
            }
        }
    </script>

</body>

</html>
