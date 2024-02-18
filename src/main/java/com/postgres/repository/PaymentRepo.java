//PaymentRepo.java

package com.postgres.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.postgres.model.PaymentModel;

public interface PaymentRepo extends JpaRepository<PaymentModel, Long> {

    PaymentModel findByUsersModelUserId(Integer userId);
}


