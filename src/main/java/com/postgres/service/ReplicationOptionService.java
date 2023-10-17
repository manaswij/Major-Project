package com.postgres.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postgres.model.ReplicationOption;
import com.postgres.repository.DropdownRepo;

@Service
public class ReplicationOptionService {

    @Autowired
    private DropdownRepo replicationOptionRepository;

    public ReplicationOption getReplicationOption(Long id) {
        return replicationOptionRepository.findById(id).orElse(null);
    }
}