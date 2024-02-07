//UsersServiceImpl.java

package com.postgres.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postgres.model.ReplicationOption;
import com.postgres.model.UsersModel;
import com.postgres.repository.UsersRepository;
import com.postgres.service.ReplicationOptionService; // Import ReplicationOptionService

import jakarta.persistence.NonUniqueResultException;
import jakarta.servlet.http.HttpSession;

import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersRepository userRepository;

    @Autowired
    private ReplicationOptionService replicationService; // Inject ReplicationOptionService
    
    

    @Override
    public UsersModel registerUser(UsersModel user) {
        ReplicationOption replicationOption = user.getReplicationOption();
        if (replicationOption != null) {
            replicationOption.setUsersModel(user);
            replicationService.saveReplicationOption(replicationOption);
        }
        return userRepository.save(user);
    }


    @Override
    public UsersModel authenticateUser(String username, String password) {
        List<UsersModel> users = userRepository.findAllByUsernameAndPassword(username, password);

        if (users.size() == 1) {
            return users.get(0);
        } else if (users.isEmpty()) {
            return null;
        } else {
            throw new NonUniqueResultException("Multiple users found for username: " + username);
        }
    }


    @Override
    public UsersModel getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
    @Override
    public UsersModel getUserByUserId(int userId) {
        return userRepository.findByUserId(userId);
    }
    
    public UsersModel getLoggedInUser(HttpSession session) {
        return (UsersModel) session.getAttribute("user");
    }

}
