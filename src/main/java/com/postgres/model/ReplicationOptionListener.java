package com.postgres.model;

import java.time.LocalDate;

import jakarta.persistence.PrePersist;


public class ReplicationOptionListener {
    
    @PrePersist
    public void prePersist(ReplicationOption replicationOption) {
        replicationOption.setEndDate(LocalDate.now());
    }
}


