//ReplicationController.java

package com.postgres.controller;

import java.time.LocalDate;

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

import jakarta.servlet.http.HttpSession;

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

        // Ensure that all fields are properly populated
        // Technique
        String technique = replicationOption.getTechnique();
        if (technique == null || technique.isEmpty()) {
            // Handle error or set default value
        }

        // Direction
        String direction = replicationOption.getDirection();
        if (direction == null || direction.isEmpty()) {
            // Handle error or set default value
        }

        // Replication Type
        String replicationType = replicationOption.getReplication_type();
        if (replicationType == null || replicationType.isEmpty()) {
            // Handle error or set default value
        }

        // Flatfile
        // Check and handle if necessary

        // Start Date
        LocalDate startDate = replicationOption.getStartDate();
        if (startDate == null) {
            // Handle error or set default value
        }

        // End Date
        LocalDate endDate = replicationOption.getEndDate();
        if (endDate == null) {
            // Handle error or set default value
        }

        // No. of Bytes
        Integer numberOfBytes = replicationOption.getNumberOfBytes();
        if (numberOfBytes == null) {
            // Handle error or set default value
        }

        // Total Amount
        Double totalAmount = replicationOption.getTotalAmount();
        if (totalAmount == null) {
            // Handle error or calculate based on other fields
        }

        // Get the existing replication option for the user
        ReplicationOption existingReplicationOption = replicationService.getReplicationOptionByCommonId2(replicationOption.getCommonId2());

        // Update the existing replication option if it exists
        if (existingReplicationOption != null) {
            // Update the existing replication option with the new values
            existingReplicationOption.setTechnique(replicationOption.getTechnique());
            existingReplicationOption.setDirection(replicationOption.getDirection());
            existingReplicationOption.setReplication_type(replicationOption.getReplication_type());
            existingReplicationOption.setFlatfile(replicationOption.getFlatfile());
            existingReplicationOption.setStartDate(replicationOption.getStartDate());
            existingReplicationOption.setEndDate(replicationOption.getEndDate());
            existingReplicationOption.setNumberOfBytes(replicationOption.getNumberOfBytes());
            existingReplicationOption.setTotalAmount(replicationOption.getTotalAmount());
            // Update any other fields as needed
            // Save the updated replication option
            replicationService.saveReplicationOption(existingReplicationOption);
        } else {
            // If no existing replication option, save the new one
            replicationService.saveReplicationOption(replicationOption);
        }

        return "Invoice";
    }

}
