//UsersController.java

package com.postgres.controller;

import com.postgres.model.ReplicationOption;
import com.postgres.model.UsersModel;
import com.postgres.service.ReplicationOptionService;
import com.postgres.service.UsersService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UsersController {

    @Autowired
    private UsersService userService;
    
    @Autowired
    private ReplicationOptionService replicationService;

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("user", new UsersModel());
        return "Register";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        model.addAttribute("user", new UsersModel());
        return "Login";
    }

    @GetMapping("/welcome")
    public String getWelcomePage() {
        return "Welcome";
    }


    @PostMapping("/register")
    public String register(@ModelAttribute UsersModel usersModel, Model model) {
        // Check if the user already exists
        UsersModel existingUser = userService.getUserByUsername(usersModel.getUsername());
        if (existingUser != null) {
            // Handle the case where the user already exists
            // You might want to redirect back to the registration page with an error message
            model.addAttribute("errorMsg", "Username already exists. Please choose a different one.");
            return "Register";
        }

        // Create a new user
     // Create a new user
        UsersModel user = new UsersModel(usersModel.getFullName(), usersModel.getUsername(), usersModel.getPassword(), usersModel.getEmail());
        user.setFullName(usersModel.getFullName());
        user.setPassword(usersModel.getPassword());
        user.setEmail(usersModel.getEmail());
        user.setUsername(usersModel.getUsername());

        // Save the user to the database
        UsersModel savedUser = userService.registerUser(user);

        // Initialize replicationOption
        ReplicationOption replicationOption = usersModel.getReplicationOption();
        if (replicationOption == null) {
            replicationOption = new ReplicationOption(); // Initialize if null
        }

        // Now that the user is saved, set the replication options for the user
        replicationOption.setUsersModel(savedUser);
        replicationService.saveReplicationOption(replicationOption);

        return "redirect:/login";
    }


    @PostMapping("/login")
    public String login(@ModelAttribute UsersModel user, Model model, HttpSession session) {
        UsersModel authenticatedUser = userService.authenticateUser(user.getUsername(), user.getPassword());
        System.out.println("Authentic user is : " + authenticatedUser);

        if (authenticatedUser != null) {
            session.setAttribute("user", authenticatedUser);
            model.addAttribute("user", authenticatedUser);
            System.out.println("Authenticated User : " + authenticatedUser.getUsername() + " with id : " + authenticatedUser.getUserId());
            return "redirect:/welcome";
        } else {
            model.addAttribute("errorMsg", "Invalid credentials. Please register.");
            return "Login";
        }
    }





    
   
   
    
    
}
