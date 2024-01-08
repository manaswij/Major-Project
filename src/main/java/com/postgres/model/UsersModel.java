package com.postgres.model;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
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
	
	@OneToMany(mappedBy = "usersModel",fetch = FetchType.EAGER) // Add fetch type
	private List<ReplicationOption> replicationOptions = new ArrayList<>();
	// Getter and setter methods...
	
	public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
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
	
	public List<ReplicationOption> getReplicationOptions() {
        return replicationOptions;
    }

    public void setReplicationOptions(List<ReplicationOption> replicationOptions) {
        this.replicationOptions = replicationOptions;
    }
    
 // Add this method to add a single ReplicationOption to the list
    public void addReplicationOption(ReplicationOption replicationOption) {
        if (!replicationOptions.contains(replicationOption)) {
            replicationOptions.add(replicationOption);
            replicationOption.setUsersModel(this); // Maintain the bidirectional relationship
        }
    }
	
}
	
	
		
