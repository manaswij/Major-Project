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
    public String saveReplicationOption(@ModelAttribute ReplicationOption replicationOption, HttpSession session) {
    	
    	
        // Retrieve the logged-in user from the session
        UsersModel loggedInUser = usersService.getLoggedInUser(session);
        
        // Check if the user is logged in
        if (loggedInUser != null) {
            // Retrieve the existing ReplicationOption associated with the user's userId
        	loggedInUser.setReplicationOptionsSelected(true);
            usersService.updateUser(loggedInUser);
            ReplicationOption existingReplicationOption = replicationService.getReplicationOptionByUserId(loggedInUser.getUserId());
            
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
                
                existingReplicationOption.setEndDate(LocalDate.now());


                // Calculate noOfDays first
                existingReplicationOption.calculateNoOfDays();

                // Set the chargeOfOneByte value
                existingReplicationOption.setChargeOfOneByte(2);

                // Calculate Total Amount based on numberOfBytes and chargeOfOneByte
                existingReplicationOption.calculateTotalAmount();

                // Save the updated ReplicationOption
                replicationService.saveReplicationOption(existingReplicationOption);
            } else {
                // If the existing ReplicationOption is not found, create a new one and associate it with the user
                replicationOption.setUsersModel(loggedInUser);

                // Calculate noOfDays first
                replicationOption.calculateNoOfDays();

                // Set the chargeOfOneByte value
                replicationOption.setChargeOfOneByte(2);

                // Calculate Total Amount based on numberOfBytes and chargeOfOneByte
                replicationOption.calculateTotalAmount();

                // Save the ReplicationOption
                replicationService.saveReplicationOption(replicationOption);
                
                
            }

            return "Invoice";
        } else {
            // Handle the case where the user is not logged in
            return "redirect:/login"; // Redirect to the login page
        }
    }
}