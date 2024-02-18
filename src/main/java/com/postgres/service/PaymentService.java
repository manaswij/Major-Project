//PaymentService.java

package com.postgres.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postgres.model.PaymentModel;
import com.postgres.repository.PaymentRepo;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepo paymentRepo;

    public PaymentModel savePayment(PaymentModel payment) {
        return paymentRepo.save(payment);
    }

	public PaymentModel getPaymentByUserId(Integer userId) {
		return paymentRepo.findByUsersModelUserId(userId);
	}
}
