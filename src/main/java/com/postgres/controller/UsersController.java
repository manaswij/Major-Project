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
        // Check if the user already exists
        UsersModel existingUser = userService.getUserByUsername(usersModel.getUsername());
        if (existingUser != null) {
            // Handle the case where the user already exists
            // You might want to redirect to a registration failure page or show an error message
            return "redirect:/registration-failure";
        }

     // Create a new user
        UsersModel user = new UsersModel();
        user.setLogin(usersModel.getLogin());
        System.out.println("Login Value Before Insert: " + user.getLogin());

        user.setPassword(usersModel.getPassword());
        user.setEmail(usersModel.getEmail());
        user.setUsername(usersModel.getUsername());
        System.out.println("User is Created ");

        // Save the user to the database
        UsersModel savedUser = userService.registerUser(user);
        usersModel.setUserId(savedUser.getUserId());

        return "redirect:/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute UsersModel user, Model model, HttpSession session) {
        UsersModel authenticatedUser = userService.authenticateUser(user.getUsername(), user.getPassword());
        System.out.println("Authenticated User: " + user.getUsername() + " with ID: " + user.getUserId());

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
