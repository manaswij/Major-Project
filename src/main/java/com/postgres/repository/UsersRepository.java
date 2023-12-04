package com.postgres.repository;

import com.postgres.model.UsersModel;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface UsersRepository extends JpaRepository<UsersModel, String> {
    UsersModel findByUsername(String username);

    List<UsersModel> findAllByUsernameAndPassword(String username, String password);

}
