package com.postgres.model;

import java.time.LocalDate;

import jakarta.persistence.PrePersist;


public class ReplicationOptionListener {
    
    @PrePersist
    public void prePersist(ReplicationOption replicationOption) {
        replicationOption.setEndDate(LocalDate.now());
        replicationOption.calculateNoOfDays();
        
        UsersModel usersModel = replicationOption.getUsersModel();
        if (usersModel != null) {
            usersModel.addReplicationOption(replicationOption);
        }
    }
}
