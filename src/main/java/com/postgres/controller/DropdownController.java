package com.postgres.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.postgres.model.ReplicationOption;
import com.postgres.repository.DropdownRepo;

@Controller
public class DropdownController {

    @Autowired
    private DropdownRepo dropdownRepo;

    @GetMapping("/")
    public String homepage(Model model) {
        model.addAttribute("replicationOption", new ReplicationOption());
        return "welcome";
    }

    @PostMapping("/saveReplicationOption")
    public String saveReplicationOption(@ModelAttribute ReplicationOption replicationOption) {
        dropdownRepo.save(replicationOption);
        return "Details";
    }
    
    
}
