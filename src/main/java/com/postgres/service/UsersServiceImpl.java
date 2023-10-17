package com.postgres.service;

import com.postgres.model.UsersModel;
import com.postgres.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersRepository userRepository;

    @Override
    public UsersModel registerUser(UsersModel user) {
        return userRepository.save(user);
    }

    @Override
    public UsersModel authenticateUser(String username, String password) {
        UsersModel user = userRepository.findByUsername(username);
        System.out.println("User Service IMPL is "+ user);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
}
