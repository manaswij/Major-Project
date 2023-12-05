package com.postgres.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.postgres.model.ReplicationOption;
import com.postgres.service.ReplicationOptionService;

@Controller
public class DropdownController {

    @Autowired
    private ReplicationOptionService replicationService;

    @GetMapping("/")
    public String homepage(Model model) {
        model.addAttribute("replicationOption", new ReplicationOption());
        return "Welcome";
    }

    @PostMapping("/saveReplicationOption")
    public String saveReplicationOption(@ModelAttribute ReplicationOption replicationOption) {
        // Calculate noOfDays first
    	// Calculate noOfDays
        replicationOption.calculateNoOfDays();

        // Set the chargeOfOneByte value
        replicationOption.setChargeOfOneByte(2);

        // Calculate Total Amount based on numberOfBytes and chargeOfOneByte
        replicationOption.calculateTotalAmount();

        // Save the replication option
        replicationService.saveReplicationOptions(replicationOption);

        System.out.println("Received Direction: " + replicationOption.getDirection());
        System.out.println("Received Start Date: " + replicationOption.getStartDate());
        System.out.println("Received End Date: " + replicationOption.getEndDate());
        System.out.println("No of days: " + replicationOption.getNoOfDays());

        return "Invoice";
    }

}
