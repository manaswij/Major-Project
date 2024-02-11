<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Pricing Package Table - Bootdey.com</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style type="text/css">
    body {
      margin-top: 20px;
    }

    .pricing-box {
      -webkit-box-shadow: 0px 5px 30px -10px rgba(0, 0, 0, 0.1);
      box-shadow: 0px 5px 30px -10px rgba(0, 0, 0, 0.1);
      padding: 35px 50px;
      border-radius: 20px;
      position: relative;
    }

    .pricing-box .plan {
      font-size: 34px;
    }

    .pricing-badge {
      position: absolute;
      top: 0;
      z-index: 999;
      right: 0;
      width: 100%;
      display: block;
      font-size: 15px;
      padding: 0;
      overflow: hidden;
      height: 100px;
    }

    .pricing-badge .badge {
      float: right;
      -webkit-transform: rotate(45deg);
      transform: rotate(45deg);
      right: -67px;
      top: 17px;
      position: relative;
      text-align: center;
      width: 200px;
      font-size: 13px;
      margin: 0;
      padding: 7px 10px;
      font-weight: 500;
      color: #ffffff;
      background: #fb7179;
    }

    .mb-2,
    .my-2 {
      margin-bottom: .5rem !important;
    }

    p {
      line-height: 1.7;
    }

    img {
      max-width: 100%;
      height: auto;
    }
  </style>
</head>

<body>
  <section class="section" id="pricing">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="title-box text-center">
            <div class="container px-4 px-lg-5">
              <!-- Heading Row-->
              <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7">
                  <img class="img-fluid rounded mb-4 mb-lg-0"
                    src="https://cdn-web.gofrugal.com/images/billing-software/visual2.png" alt="...">
                </div>
                <div class="col-lg-5">
                  <h1>Billing Plan</h1>
                  <p>Billing Module is Divided into 3 parts. Users need to select a plan according to their preference
                    and subscribe to a Monthly, Quarterly, or Yearly Plan based on their needs. We hope you enjoy this
                    experience! For a more user-friendly experience, do subscribe!</p> <a class="btn btn-primary" href="#pricing-section">Subscribe Now!</a></div>
                </div>
              </div>
              <!-- Subscribe to our plan-->
              <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body">
                  <p class="text-white m-0">This subscription to our plan is a great place to get some important
                    information or display a used charged amount!</p>
                </div>
                
              </div>
              <div>          
        <div class="row mt-5 pt-4">
          <div class="col-lg-4" >
            <div class="pricing-box mt-4" id="pricing-section">
              <h3 class="f-20" >Monthly</h3>
              <div class="mt-4 pt-2">
                <p class="mb-2"><i class="mdi mdi-checkbox-marked-circle text-success f-18 mr-2"></i><b>Seamless</b>
                  Data Replication</p>
                <p>Effortlessly replicate your critical data every month</p>
                <p class="mb-2"><i class="mdi mdi-checkbox-marked-circle text-success f-18 mr-2"></i><b>Flexible</b>
                  Billing</p>
                <p> Pay only for the data you replicate, with transparent monthly billing</p>
                <p class="mb-2"><i class="mdi mdi-checkbox-marked-circle text-success f-18 mr-2"></i><b>Scalable</b>
                  Solutions</p>
                <p>Scale your data replication needs up or down as your business evolves</p>
                <p class="mb-2"><i class="mdi mdi-checkbox-marked-circle text-success f-18 mr-2"></i><b>Risk-Free</b>
                  Trial</p>
                <p>Try our monthly plan risk-free for the first month with no commitment</p>
              </div>
              <div class="mt-4 pt-3">
                <a href="/welcome" class="btn btn-primary btn-rounded">Get Started</a>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="pricing-box mt-4">
              <div class="pricing-badge">
              </div>
              <h3 class="f-20">Quarterly</h3>
              <div class="mt-4 pt-2">
                <p class="mb-2"><i
                    class="mdi mdi-checkbox-marked-circle text-success f-18 mr-2"></i><b>Cost-Effective</b>
                  Replication</p>
                <p> Save more with quarterly plan ensuring continuous data replication</p>
                <p class="mb-2"><i class="mdi mdi-checkbox-marked-circle text-success f-18 mr-2"></i><b>Enhanced </b>
                  Performance</p>
                <p>Experience optimized performance, regular maintenance and updates</p>
                <p class="mb-2"><i class="mdi mdi-checkbox-marked-circle text-success f-18 mr-2"></i><b>Customizable</b>
                  Solutions</p>
                <p>Tailor the replication process to fit your specific business requirements</p>
                <p class="mb-2"><i class="mdi mdi-checkbox-marked-circle text-success f-18 mr-2"></i><b>Risk-Free</b>
                  Trial</p>
                <p>Try our quarterly plan risk-free for the quarter month </p>
              </div>
              <div class="mt-4 pt-3">
                <a href="/welcome" class="btn btn-primary btn-rounded">Get Started</a>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="pricing-box mt-4">
              <h3 class="f-20">Annualy</h3>
              <div class="mt-4 pt-2">
                <p class="mb-2"><i
                    class="mdi mdi-checkbox-marked-circle text-success f-18 mr-2"></i><b>Maximum </b>
                    Savings</p>
                <p>Unlock the best value with our yearly plan, offering significant cost savings.</p>
                <p class="mb-2"><i class="mdi mdi-checkbox-marked-circle text-success f-18 mr-2"></i><b>Uninterrupted  </b>
                  Replication</p>
                <p>Ensure uninterrupted data replication throughout the year</p>
                <p class="mb-2"><i class="mdi mdi-checkbox-marked-circle text-success f-18 mr-2"></i><b>Priority </b>
                  Access to New Features</p>
                <p>Be the first to access and leverage new features as they're rolled out</p>
                <p class="mb-2"><i class="mdi mdi-checkbox-marked-circle text-success f-18 mr-2"></i><b>Risk-Free</b>
                  Trial</p>
                <p>Try our quarterly plan risk-free for the quarter month </p>
              </div>
              <div class="mt-4 pt-3">
                <a href="/welcome" class="btn btn-primary btn-rounded">Get Started</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
      <br>
      <br>
  </section>
  <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">

  </script>
</body>

</html>