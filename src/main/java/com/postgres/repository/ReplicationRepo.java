//ReplicationRepo.java

package com.postgres.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.postgres.model.ReplicationOption;

public interface ReplicationRepo extends JpaRepository<ReplicationOption, Long> {
    ReplicationOption findByCommonId2(int commonId2);

}



