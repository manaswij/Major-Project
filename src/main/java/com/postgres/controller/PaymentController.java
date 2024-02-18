//PaymentController.java
package com.postgres.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.postgres.model.PaymentModel;
import com.postgres.model.ReplicationOption;
import com.postgres.service.PaymentService;

@Controller
public class PaymentController {

  @Autowired
  private PaymentService paymentService;

  @GetMapping("/payment")
  public String getPaymentPage(Model model) {
      model.addAttribute("payment", new PaymentModel());
      return "PaymentPage"; // Assuming the name of the payment page is PaymentPage.jsp or PaymentPage.html
  }

  @PostMapping("/payment")
  public String processPayment(@ModelAttribute PaymentModel payment, Model model) {
      // Retrieve the ReplicationOption associated with the user
      ReplicationOption replicationOption = payment.getUsersModel().getReplicationOption();
      if (replicationOption != null) {
          // Set the totalAmount from ReplicationOption to PaymentModel
          payment.setTotalAmount(replicationOption.getTotalAmount());
      }

      // Assuming you have logic to process the payment and save it to the database
      PaymentModel savedPayment = paymentService.savePayment(payment);
      model.addAttribute("payment", savedPayment);
      return "PaymentSuccessPage";
  }
  

}

//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//
//@Controller
//public class PaymentController {
//
//@GetMapping("/payment")
//public String showPaymentPage() {
//   return "payment"; 
//}
//}

