//UsersService.java 
package com.postgres.service;

import com.postgres.model.UsersModel;

import jakarta.servlet.http.HttpSession;

public interface UsersService {
    UsersModel registerUser(UsersModel user);
    UsersModel authenticateUser(String username, String password);
    UsersModel getUserByUsername(String username);
    UsersModel getUserByUserId(int userId);
    UsersModel getLoggedInUser(HttpSession session);
    void updateUser(UsersModel user); // Add updateUser method to the interface

}
