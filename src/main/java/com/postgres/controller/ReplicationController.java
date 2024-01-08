package com.postgres.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.postgres.model.ReplicationOption;
import com.postgres.model.UsersModel;
import com.postgres.service.ReplicationOptionService;
import com.postgres.service.UsersService;

@Controller
public class ReplicationController {

    @Autowired
    private ReplicationOptionService replicationService;

    @Autowired
    private UsersService usersService;

    @GetMapping("/")
    public String homepage(Model model) {
        model.addAttribute("replicationOption", new ReplicationOption());
        return "Welcome";
    }

    @PostMapping("/saveReplicationOption")
    public String saveReplicationOption(@ModelAttribute ReplicationOption replicationOption) {
        // Calculate noOfDays first
        replicationOption.calculateNoOfDays();

        // Set the chargeOfOneByte value
        replicationOption.setChargeOfOneByte(2);

        // Calculate Total Amount based on numberOfBytes and chargeOfOneByte
        replicationOption.calculateTotalAmount();

        replicationService.saveReplicationOptions(replicationOption);

        UsersModel usersModel = new UsersModel();

        // Save the user first
        usersService.registerUser(usersModel);

        // Set the relationship in one direction
        replicationOption.setUsersModel(usersModel);

        // Save both entities within the same transaction
        replicationService.saveReplicationOptions(replicationOption);

        // Ensure that the relationship is set in both directions (if needed)
        usersModel.addReplicationOption(replicationOption);

        // usersService.registerUser(usersModel); // Remove this line as it's redundant

        return "Invoice";
        
    }
}
