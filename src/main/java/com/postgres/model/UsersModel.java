package com.postgres.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "users2_table")
public class UsersModel {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Integer userId;
	String login;
	String username;
	String password;
	String email;
	
	@ManyToOne
    @JoinColumn(name = "user_id")  // This should match the column name in ReplicationOption
    private ReplicationOption replicationOption;
	 
	 
	// Getter and setter methods...
	
	public Integer getId() {
		return userId;
	}
	public void setId(Integer userId) {
		this.userId = userId;
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
		this.username=username;
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
	
	
		
