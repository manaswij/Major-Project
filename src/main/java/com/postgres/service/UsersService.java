//package com.postgres.service;
//
//import org.springframework.stereotype.Service;
//
//import com.postgres.model.UsersModel;
//import com.postgres.repository.UsersRepository;
//
//@Service
//public class UsersService {
//
//    private final UsersRepository usersRepository;
//
//    public UsersService(UsersRepository usersRepository) {
//        this.usersRepository = usersRepository;
//    }
//
//    public UsersModel registerUser(String login, String password, String email) {
//        if (login != null && password != null) {
//            UsersModel usersModel = new UsersModel();
//            usersModel.setLogin(login);
//            usersModel.setPassword(password);
//            usersModel.setEmail(email);
//            return usersRepository.save(usersModel);
//        } else {
//            return null;
//        }
//    }
//
//    public UsersModel authenticate(String login, String password, String email) {
//        return usersRepository.findByLoginAndPassword(login, password).orElse(null);
//    }
//}

package com.postgres.service;

import com.postgres.model.UsersModel;

public interface UsersService {
    UsersModel registerUser(UsersModel user);
    UsersModel authenticateUser(String username, String password);
    
}
