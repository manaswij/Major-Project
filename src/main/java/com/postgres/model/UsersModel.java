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

    @Column(name = "full_name")
    private String fullName;

    private String username;
    private String password;
    private String email;

    @OneToOne(mappedBy = "usersModel", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private ReplicationOption replicationOption;

    public UsersModel() {
        // Default constructor
    }

    public UsersModel(String fullName, String username, String password, String email) {
        this.fullName = fullName;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public Integer getUserId() {
        System.out.println("Authentic: " + userId);
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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
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
}
