package com.postgres.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.postgres.model.ReplicationOption;
import com.postgres.repository.DropdownRepo;

@Controller
public class DropdownController {

    @Autowired
    private DropdownRepo replicationOptionRepository;

    @PostMapping("/saveReplicationOption")
    public String saveReplicationOption(String selectedOption) {
        ReplicationOption replicationOption = new ReplicationOption(selectedOption);
        replicationOptionRepository.save(replicationOption);
        return "redirect:/"; // Redirect to your homepage
    }
    
    
}
