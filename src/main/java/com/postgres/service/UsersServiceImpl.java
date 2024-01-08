package com.postgres.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.postgres.model.UsersModel;
import com.postgres.repository.UsersRepository;
import com.postgres.service.ReplicationOptionService; // Import ReplicationOptionService

import jakarta.persistence.NonUniqueResultException;

import java.util.List;

@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersRepository userRepository;

    @Autowired
    private ReplicationOptionService replicationService; // Inject ReplicationOptionService

    @Override
    public UsersModel registerUser(UsersModel user) {
        // Make sure the replicationOption is saved before the user
        if (user.getReplicationOption() != null) {
            replicationService.saveReplicationOptions(user.getReplicationOption());
        }
        return userRepository.save(user);
    }

    @Override
    public UsersModel authenticateUser(String username, String password) {
        List<UsersModel> users = userRepository.findAllByUsernameAndPassword(username, password);

        if (users.size() == 1) {
            return users.get(0);
        } else if (users.isEmpty()) {
            // Handle the case where no user is found
            return null;
        } else {
            // Handle the case where multiple users are found (NonUniqueResultException)
            // Log a warning message
            // log.warn("Multiple users found for username: {}", username);

            // You might want to throw a custom exception or handle it differently
            throw new NonUniqueResultException("Multiple users found for username: " + username);

            // Return null to indicate that the authentication failed
            // return null; // This line is unreachable
        }
    }
}
