//ReplicationOptionService.java

package com.postgres.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.postgres.model.ReplicationOption;
import com.postgres.repository.ReplicationRepo;

import jakarta.transaction.Transactional;

@Service


public class ReplicationOptionService {

    @Autowired
    private ReplicationRepo dropdownRepo;

    public void saveReplicationOptions(ReplicationOption replicationOption) {
        dropdownRepo.save(replicationOption);
    }
    public List<ReplicationOption> getAllReplicationOptions() {
        return dropdownRepo.findAll();
        
        
    } 
}

