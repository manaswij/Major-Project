//ReplicationOptionService.java

package com.postgres.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.postgres.model.ReplicationOption;
import com.postgres.repository.ReplicationRepo;

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
    public void saveReplicationOption(ReplicationOption replicationOption) {
    	dropdownRepo.save(replicationOption);
    }
 // Add a method to fetch the replication option by commonId2
    public ReplicationOption getReplicationOptionByCommonId2(int commonId2) {
        return dropdownRepo.findByCommonId2(commonId2);
    }
    
    public ReplicationOption getReplicationOptionByUserId(Integer userId) {
        return dropdownRepo.findByUsersModelUserId(userId);
    }
}

