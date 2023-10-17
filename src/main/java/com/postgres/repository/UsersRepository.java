//package com.postgres.repository;
//
//import com.postgres.model.UsersModel;
//import org.springframework.data.jpa.repository.JpaRepository;
//import java.util.Optional;
//
//public interface UsersRepository extends JpaRepository<UsersModel, Integer>{
//	
//	Optional<UsersModel> findByLoginAndPassword(String login, String password);
//}

package com.postgres.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.postgres.model.UsersModel;

public interface UsersRepository extends JpaRepository<UsersModel, String> {
    UsersModel findByUsername(String username);
}
