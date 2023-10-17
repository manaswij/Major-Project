package com.postgres.controller;

import com.postgres.model.UsersModel;
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
    public String register(@ModelAttribute UsersModel usersModel) {
    // Create a UsersModel instance and set the necessary fields
    UsersModel user = new UsersModel();
    //user.setId(1); // Set a valid ID or use appropriate logic to generate IDs
    user.setLogin(usersModel.getLogin());
    user.setPassword(usersModel.getPassword());
    user.setEmail(usersModel.getEmail());
    user.setUsername(usersModel.getUsername());
    System.out.println("User Creates ");

    // Save the user to the database
    userService.registerUser(user);

    // Redirect to a success page or login page
    return "redirect:/login";
}

    @PostMapping("/login")
    public String login(@ModelAttribute UsersModel user, Model model, HttpSession session) {
        UsersModel authenticatedUser = userService.authenticateUser(user.getUsername(), user.getPassword());
        System.out.println("User is "+ authenticatedUser);
        if (authenticatedUser != null) {
        	session.setAttribute("user", authenticatedUser);
            model.addAttribute("user", authenticatedUser);
            return "redirect:/welcome";
        } else {
            model.addAttribute("errorMsg", "Invalid credentials. Please register.");
            return "Login";
        }
    }
    
   
   
    
    
}
