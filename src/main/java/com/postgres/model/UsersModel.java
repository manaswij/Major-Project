//UsersModel.java

package com.postgres.model;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;


@Entity
@Table(name = "users2_table")
public class UsersModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "common_id", unique = true, nullable = false)
    private int commonId;
    
 // Generate a random 4-digit number for commonId
    @PrePersist
    public void generateCommonId() {
        this.commonId = (int) (Math.random() * 9000) + 1000;
    }


    private String login;
    private String username;
    private String password;
    private String email;

    @OneToOne(mappedBy = "usersModel", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private ReplicationOption replicationOption;

    public UsersModel() {
        // Default constructor
    }
    
    

    public UsersModel(String login, String username, String password, String email) {
        this.login = login;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public Integer getUserId() {
        System.out.println("Authentic: "+ userId);
        return this.userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public int getCommonId() {
        return commonId;
    }

    public void setCommonId(int commonId) {
        this.commonId = commonId;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public ReplicationOption getReplicationOption() {
        return replicationOption;
    }

    public void setReplicationOption(ReplicationOption replicationOption) {
        this.replicationOption = replicationOption;
    }
//    public void addReplicationOption(ReplicationOption replicationOption) {
//        if (!replicationOptions.contains(replicationOption)) {
//            replicationOptions.add(replicationOption);
//            replicationOption.setUsersModel(this); // Maintain the bidirectional relationship
//        }
//    }

    
}
