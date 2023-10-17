package com.postgres.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.postgres.model.ReplicationOption;
import com.postgres.model.UsersModel;
import com.postgres.repository.DropdownRepo;
import com.postgres.service.UsersService;

@Controller
public class DropdownController {

    @Autowired
    private DropdownRepo replicationOptionService;
    
    @Autowired
    private UsersService usersService;
//    @PostMapping("/saveReplicationOption")
//    public String saveReplicationOption(String selectedOption) {
//        ReplicationOption replicationOption = new ReplicationOption(selectedOption);
//        replicationOptionRepository.save(replicationOption);
//        return "redirect:/"; // Redirect to your homepage
//    }
    
    @PostMapping("/saveReplicationOption")
    public String saveReplicationOption(@ModelAttribute UsersModel user, @RequestParam Long selectedOptionId) {
        UsersModel authenticatedUser = usersService.authenticateUser(user.getUsername(), user.getPassword());

        if (authenticatedUser != null) {
            // Get the selected replication option from the database
            ReplicationOption selectedOption = replicationOptionService.getReplicationOption(selectedOptionId);
            // ReplicationOption selectedOption = replicationOptionRepository.findById(selectedOptionId);


            if (selectedOption != null) {
                // Update the user's replication option
                authenticatedUser.setReplicationOption(selectedOption);
                usersService.saveUser(authenticatedUser);
            }
        }
        
        return "redirect:/welcome";
    }
}
