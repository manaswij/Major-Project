package com.postgres.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentSuccessController {

    @GetMapping("/paysuccess")
    public String showPaymentSuccessPage() {
        return "paysuccess"; // Assuming your paysuccess.jsp is in src/main/resources/webapp/WEB-INF directory
    }
}